import pandas as pd

# save filepath to variable for easier access
melbourne_file_path = '../data/melb_data.csv'

# read the data and store data in DataFrame titled melbourne_data
melbourne_data = pd.read_csv(melbourne_file_path) 

# print a summary of the data in Melbourne data
desc = melbourne_data.describe()
print('Data description:')
print(desc)

# What is the average building area (rounded to nearest integer)?
avg_building_area = round(melbourne_data['BuildingArea'].mean())
print(f'Average building area: {avg_building_area}')

# As of today, how old is the newest home (current year - the date in which it was built)
newest_home_age = (2020 - melbourne_data['YearBuilt']).min()
print(f'Newest home age: {newest_home_age}')
