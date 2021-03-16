from flask import Flask, render_template, request, redirect, url_for, session, Markup
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import json
import datetime

app = Flask(__name__)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = 'your secret key'

# Enter your database connection details below
app.config['MYSQL_HOST'] = 'sql4.freemysqlhosting.net'
app.config['MYSQL_USER'] = 'sql4396600'
app.config['MYSQL_PASSWORD'] = 'FflNQBLCS7'
app.config['MYSQL_DB'] = 'sql4396600'
app.config['MYSQL_DATABASE_CHARSET'] = 'utf8mb4'
app.config['MYSQL_CHARSET'] = 'utf8mb4'

# Intialize MySQL
mysql = MySQL(app)

@app.route('/')
def index():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM Question')
    questions = cursor.fetchall()
    cursor.execute('SELECT * FROM Answer')
    answers = cursor.fetchall()

    for question in questions:
        question['answers'] = []
        for answer in answers:
            if answer['Question_ID'] == question['Question_ID']:
                question['answers'].append(answer)

    markupQs = Markup(json.dumps(questions))
    return render_template('index.html', questions = questions)

@app.route('/ajax/videos/easy/<string:categoryId>')
def recommendation(categoryId):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('''
        SELECT * FROM Course
        WHERE Difficulty <= 3
        AND Category_ID = %s''', categoryId)
    row_headers=[x[0] for x in cursor.description] #this will extract row headers
    courses = cursor.fetchall()
    returnedCourses = []
    for course in courses:
        returnedCourses.append(dict(course))

    return json.dumps(returnedCourses,default=timedelta_handler)

def timedelta_handler(x):
    if isinstance(x, datetime.timedelta):
        return x.__str__()
    raise TypeError("Unknown type")
