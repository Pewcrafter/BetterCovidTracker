import os
from flask import Flask

def create_app(test_config=None):
    print("Name create_app method: ", __name__)
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        app.config.from_pyfile('config.py', silent=True)
    else:
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass
    print("app.instance_path:", app.instance_path)


    from . import db
    db.init_app(app)

    from . import data
    app.register_blueprint(data.bp)

    return app
