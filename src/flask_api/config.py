import os

from dotenv import find_dotenv
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))


load_dotenv(find_dotenv())


class Config:
    """Base class configuration that should set reasonable defaults.

    Used as the base for all the other configurations.
    """

    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True
    SECRET_KEY = "this-really-needs-to-be-changed"
    PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))

    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_DATABASE_URI = os.environ["DATABASE_URL"]

    AUDIENCE = os.getenv("AUDIENCE", None)
    TOPIC_NAME = os.getenv("TOPIC_NAME", None)
    PUBLISHER_AUDIENCE = os.getenv("PUBLISHER_AUDIENCE", None)

    GCP_AUTH_KEY = os.getenv("GCP_AUTH_KEY", None)


class Production(Config):
    DEBUG = False


class Sandbox(Config):
    DEVELOPMENT = True
    DEBUG = True


class Development(Config):
    DEVELOPMENT = True
    DEBUG = True


class Testing(Config):
    TESTING = True
