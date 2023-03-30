from flask import Blueprint
from flask import jsonify
from flask import request


bp = Blueprint("base", __name__)


@bp.route("/", methods=("GET",))
def home():
    if request.method == "POST":
        return {}, 201

    return jsonify(name="world")
