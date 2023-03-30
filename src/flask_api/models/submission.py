from __future__ import annotations

from datetime import datetime

from sqlalchemy import desc
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
    """Stores a submission of JSON data."""

    __tablename__ = "submission"

    id = db.Column(db.Integer, primary_key=True)
    type = db.Column("state", db.Enum(SubmissionType), default=SubmissionType.other)
    submitted_date = db.Column("submitted_date", db.DateTime(timezone=True), default=datetime.now())
    payload = db.Column("payload", JSONB)

    def save(self):
        """Save and commit immediately."""
        db.session.add(self)
        db.session.commit()

    def save_to_session(self):
        """Save toThe session, do not commit immediately."""
        db.session.add(self)

    @classmethod
    def find_by_id(cls, id):
        """Return the submission by id."""
        return cls.query.filter_by(id=id).one_or_none()

    @classmethod
    def get_filtered_submissions(cls):
        """Return the submissions."""
        query = cls.query.order_by(desc(Submission.submitted_date))
        return query.all()
