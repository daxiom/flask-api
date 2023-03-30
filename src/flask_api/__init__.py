from flask import Flask

from .config import Config
from .config import Production
from .models.db import db
from .resources import register_endpoints


def create_app(environment: Config = Production) -> Flask:
    app = Flask(__name__)

    app.config.from_object(environment)

    db.init_app(app)

    register_endpoints(app)

    return app
