"""Core error handlers and custom exceptions.

Following best practices from:
http://flask.pocoo.org/docs/1.0/errorhandling/
http://flask.pocoo.org/docs/1.0/patterns/apierrors/
"""
import logging
import sys

from flask import jsonify
from werkzeug.exceptions import HTTPException
from werkzeug.routing import RoutingException


logger = logging.getLogger(__name__)


def init_app(app):
    """Initialize the error handlers for the Flask app instance."""
    app.register_error_handler(HTTPException, handle_http_error)
    app.register_error_handler(Exception, handle_uncaught_error)


def handle_http_error(error):
    """Handle HTTPExceptions.

    Include the error description and corresponding status code, known to be
    available on the werkzeug HTTPExceptions.
    """
    # As werkzeug's routing exceptions also inherit from HTTPException,
    # check for those and allow them to return with redirect responses.
    if isinstance(error, RoutingException):
        return error

    response = jsonify({"message": error.description})
    response.status_code = error.code
    return response


def handle_uncaught_error(error: Exception):  # pylint: disable=unused-argument
    """Handle any uncaught exceptions.

    Since the handler suppresses the actual exception, log it explicitly to
    ensure it's logged and recorded in Sentry.
    """
    logger.error("Uncaught exception", exc_info=sys.exc_info())
    response = jsonify({"message": "Internal server error"})
    response.status_code = 500
    return response
