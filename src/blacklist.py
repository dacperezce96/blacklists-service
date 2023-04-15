from flask import Flask, jsonify, Response
from .modelos import db
from flask_restful import Api
from .vistas import VistaBlackList, VistaBlackUser

app = Flask(__name__)
app.config.from_object("src.config.Config")

db.init_app(app)

api = Api(app)
api.add_resource(VistaBlackList, '/blacklists')
api.add_resource(VistaBlackUser, '/blacklists/<email>')
