import mysql.connector
import pandas as pd

class DatabaseConnector:
    def __init__(self, host, user, password, database):
        self.host = host
        self.user = user
        self.password = password
        self.database = database
        self.connection = None
        self.cursor = None
        self.dataframes = {}
        
    def connect(self):
        try:
            self.connection = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database,
                allow_local_infile=True
            )
            self.cursor = self.connection.cursor()
            print("Connected to database")
        except mysql.connector.Error as err:
            print(f"Error connecting to database: {err}")

    def fetch_query(self, query, params=None):
        try:
            self.cursor.execute(query, params)
            result = self.cursor.fetchall()
            return result
        except mysql.connector.Error as err:
            print(f"Error executing query: {err}")

    def update_query(self, query, params=None):
        try:
            self.cursor.execute(query, params)
            self.connection.commit()
        except mysql.connector.Error as err:
            print(f"Error executing query: {err}")

    def close_connection(self):
        self.cursor.close()
        self.connection.close()

    def import_data(self, table_name):
        try:
            # Connect to the database
            self.connect()

            # Fetch the data
            query = f"SELECT * FROM {table_name}"
            data = self.fetch_query(query)

            # Convert the data to a pandas DataFrame
            df = pd.DataFrame(data)

            # Add column names to the DataFrame
            df.columns = self.cursor.column_names

            # Store the DataFrame in the dictionary
            self.dataframes[table_name] = df

            print(f"Data from {table_name} imported successfully.")
        except Exception as e:
            print(f"Error importing data: {e}")
        finally:
            # Close the connection
            self.close_connection()
            
            self.close_connection()
