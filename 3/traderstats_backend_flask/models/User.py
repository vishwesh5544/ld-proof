import uuid
from dataclasses import dataclass, asdict
from datetime import datetime
from typing import Any


@dataclass
class User:
    userid: str
    firstname: str
    lastname: str
    email: str
    password: str
    address1: str
    address2: str
    city: str
    postcode: str
    countrycode: int
    phonenumber: int
    creation_date: str

    def __init__(self, userid: str, firstname: str, lastname: str, email: str, password: str, address1: str, address2: str, city: str, postcode: str,
                 countrycode: int, phonenumber: int, creation_date: str):
        super().__init__()
        self.userid = userid
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.address1 = address1
        self.address2 = address2
        self.city = city
        self.postcode = postcode
        self.countrycode = countrycode
        self.phonenumber = phonenumber
        self.creation_date = creation_date

    def asdict(self):
        return asdict(self)
