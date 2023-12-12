TBA GYM SETUP

Prior to running, the following libraries must be downloaded to run the application: 
1. Flask download (use one, not both):
- pip install Flask
- pip3 install Flask
2. SQLAlchemy download (use one, not both)
- pip install sqlalchemy
- pip3 install sqlalchemy
3. flask-sqlalchemy download (use one, not both)
- pip install flask-sqlalchemy
- pip3 install flask-sqlalchemy

AFTER the above, the app should be ready to run. As long as you have access 
to the database instance through AWS, the app.config code will work. However,
if you are a new user, your IP must be added as an inbound rule to the security
group for AWS, due to how the instance was setup. To be added, please contact 
borbigo@uw.edu. 

After all the setup and ensuring that your IP has been added, to run in the app,
in the console, enter: python3 app.py. If that doesn't work, please try 
python app.py. You may not have python3 installed, but that shouldn't be an error.

If any issues arise, please contact borbigo@uw.edu to resolve.
