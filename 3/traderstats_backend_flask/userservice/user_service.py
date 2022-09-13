from typing import Dict, Any

from flask import current_app as app
import mysql.connector
from database.db import Db
from models.User import User
from flask_bcrypt import Bcrypt
import jwt


class UserService:
    db = mysql.connector

    def __init__(self):
        self.db = Db()
        self.jwt = jwt

    def get_user_by_email(self, email: str) -> User | None:
        cursor = self.db.cursor

        query = "SELECT * FROM user_accounts WHERE email = %s"
        val = [email]
        cursor.execute(query, val)
        result = cursor.fetchone()
        if result is None:
            return None
        else:
            print("*** User retrieved: ", result)
            return result

    def get_JWT_for_user(self) -> str:
        payload = {
            "iss": "http://localhost:5000",
            "sub": "traderstats-token"
        }

        key = "my-32-character-ultra-secure-and-ultra-long-secret"
        token = jwt.encode(payload, key, algorithm="HS256")
        print('***** token: ', token)
        return token

    def add_user_record(self, user: User) -> User:
        bcrypt = Bcrypt(app)
        cursor = self.db.cursor
        pwd_hash = bcrypt.generate_password_hash(user.password)
        setattr(user, 'password', pwd_hash)

        try:
            query = "INSERT INTO `user_accounts`(userid,firstname,lastname,email,password,address1,address2,city,postcode,countrycode,phonenumber," \
                    "creation_date)" \
                    " VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
            val = (user.userid, user.firstname, user.lastname, user.email, user.password, user.address1, user.address1, user.city, user.postcode,
                   user.countrycode, user.phonenumber, user.creation_date)
            cursor.execute(query, val)
            self.db.connection.commit()

            user_created = self.get_user_by_email(user.email)
            user_created.update({"creation_date": str(user_created["creation_date"])})
            print("*** User Created: ", user_created)
            cursor.close()
            return user_created

        except mysql.connector.Error as e:
            print(e)

        finally:
            cursor.close()

    def update_user_record(self):
        # TODO: update user records here
        pass

    def create_user_token(self, userid: str):
        # TODO: create user token
        pass
