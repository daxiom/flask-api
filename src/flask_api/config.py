import os

from dotenv import find_dotenv, load_dotenv


load_dotenv(find_dotenv())

class Config:
    """Base class configuration that should set reasonable defaults.

    Used as the base for all the other configurations.
    """

    PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))

    AUDIENCE = os.getenv('AUDIENCE', None)
    TOPIC_NAME = os.getenv('TOPIC_NAME', None)
    PUBLISHER_AUDIENCE = os.getenv('PUBLISHER_AUDIENCE', None)

    GCP_AUTH_KEY = os.getenv('GCP_AUTH_KEY', None)
