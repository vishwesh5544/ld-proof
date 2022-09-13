from dataclasses import dataclass, asdict

from models.User import User


@dataclass
class UserAndToken:
    email: str
    token: str

    def __init__(self, email: str, token: str):
        super().__init__()
        self.email = email
        self.token = token

    def asdict(self):
        return asdict(self)
