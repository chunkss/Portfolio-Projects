#import libraries
!pip install pymysql
import kaggle
import zipfile
import pandas as pd
import sqlalchemy as sal

# Download dataset from kaggle
!kaggle datasets download ankitbansal06/retail-orders --force

# Extract the downloaded zip file
zip_ref = zipfile.ZipFile('retail-orders.zip')
zip_ref.extractall("C:/Users/mw-user/python+sql")
zip_ref.close()

# Read data from the file and handling null values
df = pd.read_csv("orders.csv", na_values = ['Not Available','unknown'])
df['Ship Mode'].unique()

# Rename columns: all lower case and replace space with underscore
df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(' ','_')
df.head()

# Derive new columns : discount, sale_price, profit
df['discount'] = df['list_price']*df['discount_percent']*.01
df['sale_price'] = df['list_price'] - df['discount']
df['profit'] = df['sale_price'] - df['cost_price']
df.head()

# Convert date into datetime
df.dtypes
pd.to_datetime(df['order_date'],format="%Y-%m-%d")

# Delete columns:cost_price,list_price,discount_percent
df.drop(columns=['cost_price','list_price','discount_percent'],inplace=True)
df

# Load the data into MySQL Workbench
username = "root"
password = "Password"
host = "localhost"
port = 3306
database = "retail_db"

# Create SQLAlchemy engine
engine = sal.create_engine(f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}")
df.to_sql("orders", con=engine, if_exists="append", index=False)

