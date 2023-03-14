from flask import Flask

from .base import bp as base_endpoint


def register_endpoints(app: Flask):
    app.register_blueprint(
        base_endpoint,
        url_prefix="/",
    )
