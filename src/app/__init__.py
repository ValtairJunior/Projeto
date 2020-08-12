from flask import Flask
from instance import app_config
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api
from flask_cors import CORS

db = SQLAlchemy()
api = Api()


def _instances_blueprint(app):
    from app.controllers import bp as controllers
    app.register_blueprint(controllers)

    from app.middlewares import bp as middlewares
    app.register_blueprint(middlewares)

    from app.models import bp as models
    app.register_blueprint(models)


def create_app():
    app = Flask(__name__,  instance_relative_config=True)
    app.config.from_object(app_config['development'])
    app.config.from_pyfile('config.py')

    db.init_app(app)
    CORS(app)

    _instances_blueprint(app)
    api.init_app(app)

    Migrate(app, db)

    return app
