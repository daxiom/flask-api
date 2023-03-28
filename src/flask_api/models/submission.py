from __future__ import annotations

from sqlalchemy.dialects.postgresql import JSONB

from .db import db
from .versioned_history import Versioned


class Submission(Versioned, db.Model):
    """Used to hold the audit information for a User of this service."""

    __tablename__ = "submission"

    id = db.Column(db.Integer, primary_key=True)
    payload = db.Column("payload", JSONB)
