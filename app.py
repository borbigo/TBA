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
# calendar view - of the week
# - initial view:
#   - similar to merchandise view
#   - show the class name, time (class table), instructor (employee table - type = trainer, location = selected)
@app.route('/activity', methods=['GET', 'POST']) 
def activity():
  # Fetch all gym locations
  locations_query = text('SELECT DISTINCT Location FROM GYM')
  locations_result = db.session.execute(locations_query)
  all_locations = [row[0] for row in locations_result]

  # Determine the selected location
  selected_location = all_locations[0] if all_locations else None

  if request.method == 'POST':
    # If form is submitted, update the selected location
    selected_location = request.form.get('location')
        
  # Fetch gear data based on the selected location
  info_query = text(f'''
    SELECT CLASS.Type, CLASS.Time, CLASS.Day, EMPLOYEE.Name AS Instructor, GYM.Location AS Location
    FROM CLASS
    JOIN EMPLOYEE ON CLASS.ID = EMPLOYEE.ClassID
    JOIN GYM ON CLASS.Branch = GYM.Location
    WHERE GYM.Location = "{selected_location}"
  ''')

  info_result = db.session.execute(info_query, {'selected_location': selected_location})
  # print(f"Selected Location: {selected_location}")
  # print(f"Columns: {info_result.keys()}")
    
  # Pass the data to the HTML template
  return render_template('activity.html', all_locations=all_locations, selected_location=selected_location, gear_columns=info_result.keys(), gear_result=info_result)

# active reservations
@app.route('/reservations', methods=['GET', 'POST'])
def reservations():
   # Fetch all gym locations
  locations_query = text('SELECT DISTINCT Location FROM GYM')
  locations_result = db.session.execute(locations_query)
  all_locations = [row[0] for row in locations_result]

  # Determine the selected location
  selected_location = all_locations[0] if all_locations else None

  if request.method == 'POST':
    # If form is submitted, update the selected location
    selected_location = request.form.get('location')
  
  info_query = text(f'''
    SELECT MEMBER.Name AS Member, ROOM.Name AS Room, ROOM.Branch 
    FROM MEMBER
    JOIN ROOM 
    ON MEMBER.Reserved = ROOM.RoomID
    WHERE ROOM.Branch = "{selected_location}"
  ''')
  info_result = db.session.execute(info_query, {'selected_location': selected_location})
  return render_template('reservations.html', all_locations=all_locations, selected_location=selected_location, gear_columns=info_result.keys(), gear_result=info_result)

# create and view employees 
# view by group (i.e. all front desk, all trainers)
@app.route('/employees', methods=['GET', 'POST']) 
def employees():
  # Fetch distinct locations from the GYM table
    Type_query = text('SELECT DISTINCT Type FROM EMPLOYEE')
    Type_result = db.session.execute(Type_query)
    all_Types = [row[0] for row in Type_result]

    # Default location (first one) for initial rendering
    selected_Type = all_Types[0] if all_Types else None

    if request.method == 'POST':
        # If form is submitted, update the selected location
        selected_Type = request.form.get('type')

    # Fetch gear data based on the selected location
    gear_query = text(f'SELECT * FROM EMPLOYEE WHERE Type = "{selected_Type}"')
    gear_result = db.session.execute(gear_query)

    # Print debug information
    # print(f"Selected Location: {selected_location}")

    # Print the structure of the result set
    # print(f"Columns: {gear_result.keys()}")

    return render_template('employees.html', all_Types=all_Types, selected_Type=selected_Type, employee_column=gear_result.keys(), employee_result=gear_result)

# view amenities specifically rooms
#TODO in progress - starting html file 
@app.route('/amenities') 
def amenities():
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
    gear_query = text(f'SELECT * FROM ROOM WHERE Branch = "{selected_location}"')
    gear_result = db.session.execute(gear_query)

    # Print debug information
    # print(f"Selected Location: {selected_location}")

    # Print the structure of the result set
    # print(f"Columns: {gear_result.keys()}")

    return render_template('amenities.html', all_locations=all_locations, selected_location=selected_location, amenities_column=gear_result.keys(), amenities_result=gear_result)

# view equipment (name, type, weight)
#TODO in progress - formatting needed
@app.route('/equipment' , methods=['GET', 'POST']) 
def equipment():
  # Fetch distinct locations from the GYM table
    Type_query = text('SELECT DISTINCT Type FROM EQUIPMENT')
    Type_result = db.session.execute(Type_query)
    all_Types = [row[0] for row in Type_result]

    # Default location (first one) for initial rendering
    selected_Type = all_Types[0] if all_Types else None

    if request.method == 'POST':
        # If form is submitted, update the selected location
        selected_Type = request.form.get('type')

    # Fetch gear data based on the selected location
    gear_query = text(f'''
      SELECT E.Name AS 'Equipment', E. Weight, E.Type, E.Location, R.RoomID, R.Name AS 'Room'
      FROM EQUIPMENT E, ROOM R
      WHERE E.Location = R.RoomID
      AND E.Type = "{selected_Type}"
    ''')
    gear_result = db.session.execute(gear_query)

    # Print debug information
    # print(f"Selected Location: {selected_location}")

    # Print the structure of the result set
    # print(f"Columns: {gear_result.keys()}")

    return render_template('equipment.html', all_Types=all_Types, selected_Type=selected_Type, employee_column=gear_result.keys(), employee_result=gear_result)

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

  gear_query = text(f'SELECT COUNT(*) FROM MEMBER') 
  gear_result = db.session.execute(gear_query)

  return render_template('community.html', all_data = data_list, member_result = gear_result)

if __name__ == '__main__':
  app.run(debug=True)