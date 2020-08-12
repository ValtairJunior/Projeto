all:


create_environment:
	mkdir src ; touch docker-compose.yml; touch Dockerfile ; 
	touch LICENSE ; touch README.md ; touch requirements.txt;
	mkdir src/app; mkdir src/database; mkdir src/docs; mkdir src/instance; 
	mkdir src/test; touch src/run.py; mkdir src/app/controllers; mkdir src/app/errors;
	mkdir src/app/middlewares; mkdir src/app/models; mkdir src/app/views;
	mkdir src/app/views/static; mkdir src/app/views/templates; touch src/app/__init__.py; 
	touch src/app/controllers/__init__.py; touch src/app/errors/__init__.py;
	touch src/app/middlewares/__init__.py; touch src/app/models/__init__.py;
	touch src/instance/__init__.py; touch src/instance/config.py; tree

pipenv:
	pipenv --three; pipenv shell

pipenv_installs:
	pipenv install Flask ;pipenv install Flask-Mail ;
	pipenv install Flask-Migrate; pipenv install Flask-RESTful ;
	pipenv install PyJWT; pipenv install SQLAlchemy; pipenv graph

pipenv_dev_package:
	pipenv install --dev pylint; pipenv graph

run_dev:
	export FLASK_APP=src/run.py ; export FLASK_ENV=development ; flask run 

