from flask import Blueprint

bp = Blueprint("controllers", __name__)

from app.controllers import user