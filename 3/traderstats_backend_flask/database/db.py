import mysql.connector


class Db:
    def __init__(self):
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="traderstats"
        )
        self.cursor = self.connection.cursor(dictionary=True)
