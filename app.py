from flask import Flask, render_template, jsonify, session, request
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

# displays available classes for users -> needs to filter by day and/or time and/or branch
#TODO in progress - starting html file 
@app.route('/activity') 
def activity():
  data_list = get_data("CLASS")
  session['all_data'] = data_list
  return render_template('activity.html')

# active reservations
#! unfinished
@app.route('/reservations')
def reservations():
  return render_template('reservations.html')

# create and view employees 
# view by group (i.e. all front desk, all trainers)
#! unfinished
@app.route('/employees') 
def employees():
  return render_template('employees.html')

# view amenities specifically rooms
#TODO in progress - starting html file 
@app.route('/amenities') 
def amenities():
  data_list = get_data("ROOM")
  session['all_data'] = data_list
  return render_template('amenities.html', all_data = data_list)

# view equipment (name, type, weight)
#TODO in progress - data is dumping formatting is still needed
@app.route('/equipment') 
def equipment():
  data_list = get_data("EQUIPMENT")
  session['all_data'] = data_list
  return render_template('equipment.html', all_data = data_list)

# just a merchandise page
@app.route('/merchandise', methods=['GET', 'POST']) 
def merchandise():
  # Fetch distinct locations from the GYM table
    locations_query = text('SELECT DISTINCT Location FROM GYM')
    locations_result = db.session.execute(locations_query)
    all_locations = [row[0] for row in locations_result]

    # Default location (first one) for initial rendering
    selected_location = all_locations[0] if all_locations else None

    if request.method == 'POST':
        # If form is submitted, update the selected location
        selected_location = request.form.get('location')

    # Fetch gear data based on the selected location
    gear_query = text(f'SELECT * FROM GEAR WHERE Branch = "{selected_location}"')
    gear_result = db.session.execute(gear_query)

    # Print debug information
    # print(f"Selected Location: {selected_location}")

    # Print the structure of the result set
    # print(f"Columns: {gear_result.keys()}")

    return render_template('merchandise.html', all_locations=all_locations, selected_location=selected_location, gear_columns=gear_result.keys(), gear_result=gear_result)


# shows off member information (omits personal info)
@app.route('/community') 
def community():
  data_list = get_data("MEMBER")
  session['all_data'] = data_list
  return render_template('community.html', all_data = data_list)

if __name__ == '__main__':
  app.run(debug=True)
