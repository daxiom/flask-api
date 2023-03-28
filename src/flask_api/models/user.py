"""This manages a User record that can be used in an audit trail.

Actual user data is kept in the OIDC and IDP services, this data is
here as a convenience for audit and db reporting.
"""
from __future__ import annotations

from enum import auto

from flask import current_app

from .db import db
from flask_api.utils.enum import BaseEnum


class UserRoles(BaseEnum):
    """Enum of the roles used across the domain."""

    admin_edit = auto()
    basic = auto()
    bn_edit = auto()
    colin = auto()
    public_user = auto()
    staff = auto()
    system = auto()


class User(db.Model):
    """Used to hold the audit information for a User of this service."""

    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(1000), index=True)
    firstname = db.Column(db.String(1000))
    lastname = db.Column(db.String(1000))
    middlename = db.Column(db.String(1000))
    email = db.Column(db.String(1024))
    sub = db.Column(db.String(36), unique=True)
    iss = db.Column(db.String(1024))
    idp_userid = db.Column(db.String(256), index=True)
    login_source = db.Column(db.String(200), nullable=True)
    creation_date = db.Column(db.DateTime(timezone=True))

    @property
    def display_name(self):
        """Display name of user; do not show sensitive data like BCSC username.

        If there is actual name info, return that; otherwise username.
        """
        if self.firstname or self.lastname or self.middlename:
            return " ".join(filter(None, [self.firstname, self.middlename, self.lastname])).strip()

        # parse off idir\ or @idir
        if self.username[:4] == "idir":
            return self.username[5:]
        if self.username[-4:] == "idir":
            return self.username[:-5]

        # do not show services card usernames
        if self.username[:4] == "bcsc":
            return None

        return self.username if self.username else None

    @classmethod
    def find_by_id(cls, submitter_id: int = None):
        """Return a User if they exist and match the provided submitter id."""
        return cls.query.filter_by(id=submitter_id).one_or_none()

    @classmethod
    def find_by_jwt_token(cls, token: dict) -> User | None:
        """Return a User if they exist and match the provided JWT."""
        if user_id := token.get("idp_userid"):
            return cls.query.filter_by(idp_userid=user_id).one_or_none()
        return None

    @classmethod
    def create_from_jwt_token(cls, token: dict):
        """Create a user record from the provided JWT token.

        Use the values found in the vaild JWT for the realm
        to populate the User audit data
        """
        if token:
            conf = current_app.config
            user = User(
                username=token.get(conf.get("JWT_OIDC_USERNAME"), None),
                firstname=token.get(conf.get("JWT_OIDC_FIRSTNAME"), None),
                lastname=token.get(conf.get("JWT_OIDC_LASTNAME"), None),
                iss=token["iss"],
                sub=token["sub"],
                idp_userid=token["idp_userid"],
                login_source=token["loginSource"],
            )
            current_app.logger.debug(f"Creating user JWT:{token}; User:{user}")
            db.session.add(user)
            db.session.commit()
            return user
        return None

    @classmethod
    def get_or_create_user_by_jwt(cls, jwt_oidc_token):
        """Return a valid user for audit tracking purposes."""
        # GET existing or CREATE new user based on the JWT info
        try:
            user = User.find_by_jwt_token(jwt_oidc_token)
            current_app.logger.debug(f"finding user: {jwt_oidc_token}")
            if not user:
                current_app.logger.debug(f"didnt find user, create new user:{jwt_oidc_token}")
                user = User.create_from_jwt_token(jwt_oidc_token)

            return user
        except Exception as err:
            current_app.logger.error(err.with_traceback(None))
            raise Exception(
                "unable_to_get_or_create_user",
                '{"code": "unable_to_get_or_create_user",'
                '"description": "Unable to get or create user from the JWT"}',
            ) from err

    @classmethod
    def find_by_username(cls, username):
        """Return the oldest User record for the provided username."""
        return cls.query.filter_by(username=username).order_by(User.creation_date.desc()).first()

    @classmethod
    def find_by_sub(cls, sub):
        """Return a User based on the unique sub field."""
        return cls.query.filter_by(sub=sub).one_or_none()

    def save(self):
        """Store the User into the local cache."""
        db.session.add(self)
        db.session.commit()

    def delete(self):
        """Cannot delete User records."""
        return self
        # need to intercept the ORM and stop Users from being deleted
