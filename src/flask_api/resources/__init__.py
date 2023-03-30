from flask import Flask

from .base import bp as base_endpoint
from .submission import bp as submission_endpoint


def register_endpoints(app: Flask):
    # Allow base route to match with, and without a trailing slash
    app.url_map.strict_slashes = False

    app.register_blueprint(
        url_prefix="/",
        blueprint=base_endpoint,
    )

    app.register_blueprint(
        url_prefix="/plots",
        blueprint=submission_endpoint,
    )
