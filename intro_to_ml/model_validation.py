import pandas as pd
from sklearn.metrics import mean_absolute_error
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor

# save filepath to variable for easier access
melbourne_file_path = '../data/melb_data.csv'

# read the data and store data in DataFrame titled melbourne_data
melbourne_data = pd.read_csv(melbourne_file_path)

# dropna drops missing values (think of na as "not available")
melbourne_data = melbourne_data.dropna(axis=0)

# Prediction target
y = melbourne_data.Price

# Features
melbourne_features = ['Rooms', 'Bathroom', 'Landsize', 'Lattitude', 'Longtitude']
X = melbourne_data[melbourne_features]

# Define model. Specify a number for random_state to ensure same results each run
melbourne_model = DecisionTreeRegressor(random_state=1)

# Fit model
melbourne_model.fit(X, y)

# Make predictions
predicted_home_prices = melbourne_model.predict(X)

mae = mean_absolute_error(y, predicted_home_prices)

print(f"Mean Absolute Error: {mae}")

# Split training data and validation data
train_X, val_X, train_y, val_y = train_test_split(X, y, random_state=0)

# Define model
melbourne_model = DecisionTreeRegressor(random_state=1)

# Fit model
melbourne_model.fit(train_X, train_y)

# get predicted prices on validation data
val_predictions = melbourne_model.predict(val_X)

mae = mean_absolute_error(val_y, val_predictions)

print(f"Mean Absolute Error: {mae}")
