import json
import uuid
from dataclasses import asdict

from flask import g, request, current_app as app, jsonify
from flask_bcrypt import Bcrypt
from flask_restful import Resource, Api

from errors.errors import *
from models.User import User
from models.UserAndToken import UserAndToken
from userservice.user_service import UserService
from datetime import datetime


class RegisterUser(Resource):
    def __init__(self):
        with app.app_context():
            self.userService = UserService()

    def post(self):
        request_body = request.get_json()

        # TODO: add utility to validate user creation request - if valid, proceed to check email, else throw invalid request error

        if self.userService.get_user_by_email(request_body["email"]) is not None:
            return USER_EXISTS

        firstname = request_body["firstname"]
        lastname = request_body["lastname"]
        email = request_body["email"]
        password = request_body["password"]
        address1 = request_body["address1"]
        address2 = request_body["address2"]
        city = request_body["city"]
        postcode = request_body["postcode"]
        countrycode = request_body["countrycode"]
        phonenumber = request_body["phonenumber"]

        user = User(
            userid=uuid.uuid4().__str__(),
            firstname=firstname,
            lastname=lastname,
            email=email,
            password=password,
            address1=address1,
            address2=address2,
            city=city,
            postcode=postcode,
            countrycode=countrycode,
            phonenumber=phonenumber,
            creation_date=datetime.now().__str__(),
        )

        user_created = self.userService.add_user_record(user)

        return user_created


class LoginUser(Resource):
    # TODO: Controller for logging in user, returns UserAndToken
    def __init__(self):
        with app.app_context():
            self.userService = UserService()

    def post(self):
        bcrypt = Bcrypt()
        request_body = request.get_json()
        print(request_body)
        email = request_body["email"]
        password = request_body["password"]

        if self.userService.get_user_by_email(email) is not None:
            user = self.userService.get_user_by_email(email)
            # setattr(user, 'creation_date', user['creation_date'])
            print("** creation", user['creation_date'])
            if bcrypt.check_password_hash(user['password'], password):
                # user and token
                user_and_token = UserAndToken(email=user['email'], token=self.userService.get_JWT_for_user())
                print('******* user and token: ', user_and_token)
                return user_and_token.asdict()
            else:
                return INCORRECT_EMAIL_PASSWORD
        else:
            return INCORRECT_EMAIL_PASSWORD


class LogoutUser(Resource):
    # TODO: Controller for logging out user, returns User
    pass


class UserController(Resource):
    def __init__(self):
        with app.app_context():
            self.userService = UserService()

    def post(self):
        # TODO: get email from request
        request.json.get("name").strip()
        res = self.userService.get_user_by_email("vs@gmail.com")
        return request.json.get("name").strip()

    # def get(self):
    #     return self.userService.fetch_tables()
