from flask import Flask, render_template, jsonify, session
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://admin:TotalBodyAthletics@gym-db.c5fopmlkwx7y.us-east-1.rds.amazonaws.com:3306/TBAGYM'
app.config['SECRET_KEY'] = 'TBA_CSS475_Fall2023'
db = SQLAlchemy(app)

# function to get the data fro the AWS database   
def get_data(table_name):
  try:
    query = text('SELECT * FROM ' + table_name)
    result = db.session.execute(query)
    columns = result.keys()
    data_list = [dict(zip(columns, row)) for row in result.fetchall()]
    return data_list
  except Exception as e:
    print(f'Database query error: {str(e)}')
    return []

# home page (shows all options)
@app.route('/')
def index():
  return render_template('index.html')

# shows off locations i.e. varying instances of gym location (Seattle, Bothell, etc.)
@app.route('/find_club')
def find_club():
  data_list = get_data("GYM")
  session['all_data'] = data_list
  return render_template('find_club.html', all_data = data_list) 

# space/room availability -> what's booked out for classes
#! unfinished
@app.route('/schedule_reservations')
def schedule_reservations():
  return render_template('schedule_reservations.html')

# covers recent gym activity/workouts
#! unfinished
@app.route('/activity') 
def activity():
  return render_template('activity.html')

# create and view employees
# view by group (i.e. all front desk, all trainers)
#! unfinished
@app.route('/employees') 
def employees():
  return render_template('employees.html')

# view amenities specifically rooms
#! unfinished
@app.route('/amenities') 
def amenities():
  return render_template('amenities.html')

# view equipment (name, type, weight)
#TODO in progress
@app.route('/equipment') 
def equipment():
  data_list = get_data("EQUIPMENT")
  session['all_data'] = data_list
  return render_template('equipment.html', all_data = data_list)

# just a merchandise page
#TODO: in progress
@app.route('/merchandise') 
def merchandise():
  data_list = get_data("GEAR")
  session['all_data'] = data_list
  return render_template('merchandise.html', all_data = data_list)

# shows off member information (omits personal info)
@app.route('/community') 
def community():
  data_list = get_data("MEMBER")
  session['all_data'] = data_list
  return render_template('community.html', all_data = data_list)

if __name__ == '__main__':
  app.run(debug=True)
