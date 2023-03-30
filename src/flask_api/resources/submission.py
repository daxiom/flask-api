from http import HTTPStatus

from flask import Blueprint
from flask import jsonify
from flask import request

from flask_api.models import Submission


bp = Blueprint("submission", __name__)


@bp.route("/", methods=("GET",))
@bp.route("/<id>", methods=("GET",))
def registers(id: int | None = None):
    """Get the submissions, or sepcific submission by id."""
    if id:
        if submission := Submission.find_by_id(id):
            return jsonify(type=submission.type, submission=submission.payload)
        return {}, HTTPStatus.NOT_FOUND

    submissions = Submission.get_filtered_submissions()

    return jsonify(submissions)


@bp.route("/", methods=("POST",))
def create_register():
    if json_input := request.get_json():
        # normally do some validation here
        submission = Submission()
        submission.payload = json_input
        submission.save()
        return jsonify(id=submission.id), HTTPStatus.CREATED

    return {}, HTTPStatus.BAD_REQUEST
