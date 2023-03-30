import contextlib
import os
import subprocess
from contextlib import suppress
from glob import glob
from uuid import uuid4

import pytest
import sqlalchemy.exc
from flask import Flask
from flask_migrate import Migrate
from flask_migrate import upgrade
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import event
from sqlalchemy import text

from flask_api import create_app
from flask_api import db as _db
from flask_api.config import Testing

SERVICE_NAME = "flask_api"
DB_USER = Testing.DATABASE_TEST_USERNAME
DB_PASS = Testing.DATABASE_TEST_PASSWORD
DB_NAME = Testing.DATABASE_TEST_NAME
DB_HOST = Testing.DATABASE_TEST_HOST
DB_PORT = Testing.DATABASE_TEST_PORT


def create_test_db(user: str, password: str, database: str, host: str = "localhost", port: int = 1521) -> bool:
    """Create the database in our .devcontainer launched postgres DB.

    Parameters
    ------------
        user: str
            A datbase user that has create database privledges
        password: str
            The users password
        database: str
            The name of the database to create
        host: str, Optional
            The network name of the server
        port: int, Optional
            The numeric port number
    Return
    -----------
        : bool
            If the create database succeeded.
    """
    DATABASE_URI = f"postgresql://{user}:{password}@{host}:{port}/{user}"
    try:
        with sqlalchemy.create_engine(DATABASE_URI, isolation_level="AUTOCOMMIT").connect() as conn:
            conn.execute(text(f"CREATE DATABASE {database}"))

        return True
    except sqlalchemy.exc.ProgrammingError as err:
        print(err)  # used in the test suite, so on failure print something
        return False


def load_sql_test_data(
    user: str, password: str, database: str, file_name: str = "*.sql", host: str = "localhost", port: int = 1521
):
    basedir = os.path.abspath(os.path.dirname(__file__))
    datadir = os.path.join(basedir, "data", "sql", file_name)
    files = glob(datadir)
    for file in files:
        load_psql_file(user=user, password=password, database=database, file_path=file, host=host, port=port)


def load_psql_file(user: str, password: str, database: str, file_path: str, host: str = "localhost", port: int = 1521):
    """Loads a .psql file to a PostgreSQL database using subprocess"""

    # Build the psql command string
    cmd = ["psql", "--echo-errors", "-W", "-d", database, "-h", host, "-p", port, "-U", user, "-f", file_path]

    env = {"PGPASSWORD": password}

    # Run the command using subprocess
    result = subprocess.run(cmd, env=env, shell=False, capture_output=True)

    # Check if there were any errors
    if result.returncode != 0:
        # If there were errors, raise an exception
        raise Exception(result.stderr.decode("utf-8"))

    # If there were no errors, return the output
    return result.stdout.decode("utf-8")


def drop_test_db(user: str, password: str, database: str, host: str = "localhost", port: int = 1521):
    """Delete the database in our .devcontainer launched postgres DB."""
    DATABASE_URI = f"postgresql://{user}:{password}@{host}:{port}/{user}"
    close_all = f"""
        SELECT pg_terminate_backend(pg_stat_activity.pid)
        FROM pg_stat_activity
        WHERE pg_stat_activity.datname = '{database}'
        AND pid <> pg_backend_pid();
    """
    with contextlib.suppress(sqlalchemy.exc.ProgrammingError):
        with sqlalchemy.create_engine(DATABASE_URI, isolation_level="AUTOCOMMIT").connect() as conn:
            conn.execute(text(close_all))
            conn.execute(text(f"DROP DATABASE {database}"))


def migrate_database(app: Flask, db: SQLAlchemy):
    """Migrate the database using the Alembic versioning scripts."""
    Migrate(app, db)
    upgrade()


@pytest.fixture(scope="session")
def temp_database_name():
    temp_database_name = (SERVICE_NAME + uuid4().hex)[:31]

    return temp_database_name


@pytest.fixture(scope="session")
def app(temp_database_name):
    global DB_NAME
    DB_NAME = temp_database_name
    Testing.DB_NAME = temp_database_name
    Testing.DATABASE_TEST_NAME = temp_database_name
    Testing.SQLALCHEMY_DATABASE_URI = f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{temp_database_name}"

    app = create_app(Testing)

    yield app


@pytest.fixture(scope="session")
def client(app):
    """Return a session-wide Flask test client."""
    return app.test_client()


@pytest.fixture(scope="session")
def db(app):  # pylint: disable=redefined-outer-name, invalid-name
    """Return a session-wide initialised database."""
    with app.app_context():
        create_test_db(DB_USER, DB_PASS, DB_NAME, DB_HOST, DB_PORT)
        try:
            migrate_database(app, _db)
        except Exception as err:
            print(err)

        load_sql_test_data(user=DB_USER, password=DB_PASS, database=DB_NAME, host=DB_HOST, port=DB_PORT)

        yield _db

        # Clean up
        drop_test_db(DB_USER, DB_PASS, DB_NAME, DB_HOST, DB_PORT)


@pytest.fixture(scope="function")
def session(db):  # pylint: disable=redefined-outer-name, invalid-name
    """Return a function-scoped session."""
    conn = db.engine.connect()
    txn = conn.begin()

    # TODO: _make_scoped_session was made private in the new version
    # Should review this to remove using private methods and find a public way
    options = dict(bind=conn, binds={})
    sess = db._make_scoped_session(options=options)

    # establish  a SAVEPOINT just before beginning the test
    # (http://docs.sqlalchemy.org/en/latest/orm/session_transaction.html#using-savepoint)
    sess.begin_nested()

    @event.listens_for(sess(), "after_transaction_end")
    def restart_savepoint(sess2, trans):  # pylint: disable=unused-variable
        # Detecting whether this is indeed the nested transaction of the test
        if trans.nested and not trans._parent.nested:  # pylint: disable=protected-access
            # Handle where test DOESN'T session.commit(),
            sess2.expire_all()
            sess.begin_nested()

    db.session = sess

    sql = text("select 1")
    sess.execute(sql)

    yield sess

    with suppress(Exception):
        # Cleanup
        sess.remove()
        # This instruction rollsback any commit that were executed in the tests.
        txn.rollback()
        conn.close()
