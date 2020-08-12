from flask_restful import Resource, request

# from app.models import User
from app import db, api

class UserController(Resource):
  def post(self):
    return {"message": "User successfully registered", "status": 200}

api.add_resource(UserController, '/user')