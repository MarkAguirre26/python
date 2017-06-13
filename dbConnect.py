import MySQLdb
from flask import Flask

app = Flask(__name__)


def connection():
    conn = MySQLdb.connect(host="localhost", user="root", passwd="", db="exampython")

    c = conn.cursor()

    return c, conn
