from flask import Flask

from .config import Config
from .models.db import db
from .resources import register_endpoints


def create_app(environment: str = "config.Production") -> Flask:
    app = Flask(__name__)

    app.config.from_object(Config())

    db.init_app(app)

    register_endpoints(app)

    return app
