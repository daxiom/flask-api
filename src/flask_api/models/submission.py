from __future__ import annotations

from sqlalchemy.dialects.postgresql import JSONB

from .db import db
from .versioned_history import Versioned
from flask_api.utils.enum import auto
from flask_api.utils.enum import BaseEnum


class SubmissionType(BaseEnum):
    """Enum of the roles used across the domain."""

    other = auto()
    standard = auto()


class Submission(Versioned, db.Model):
    """Used to hold the audit information for a User of this service."""

    __tablename__ = "submission"

    id = db.Column(db.Integer, primary_key=True)
    type = db.Column("state", db.Enum(SubmissionType))
    payload = db.Column("payload", JSONB)
