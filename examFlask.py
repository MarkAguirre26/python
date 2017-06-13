import random
from datetime import datetime
from functools import wraps, update_wrapper
import pygal

from flask import Flask, request, render_template, session, abort, flash, jsonify, redirect, \
    url_for, make_response

from dbConnect import connection
from flask_util_js import FlaskUtilJs

import json
import os

app = Flask(__name__)
fujs = FlaskUtilJs(app)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/insert')
def insert():
    try:
        color = request.args.get('cbo_color')
        name = request.args.get('name')
        c, conn = connection()
        c.execute("INSERT INTO `t_cars` (`name`, `color`) VALUES (%s, %s)", (name, color))
        conn.commit()
        data = {'msg': "true", 'color': color, 'name': name}
        return jsonify({'status': data})
    except Exception as e:
        return str(e)


@app.route('/fetchData')
def fetchData():
    try:
        c, conn = connection()
        c.execute("call sp_cars()")
        data_list = c.fetchall()
        return json.dumps(data_list, default=str, sort_keys=True, ensure_ascii=False)
    except Exception as e:
        return str(e)


@app.route('/fetchCars/<string:color>')
def fetchCars(color):
    try:
        c, conn = connection()
        c.execute("SELECT t_cars.cn, t_cars.`name`, t_cars.color FROM t_cars WHERE t_cars.color = %s ORDER BY t_cars.cn ASC", color)
        data_list = c.fetchall()
        return json.dumps(data_list, default=str, sort_keys=True, ensure_ascii=False)
    except Exception as e:
        return str(e)


port = random.randint(1000, 6000)
if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True, host='localhost', port=port)
