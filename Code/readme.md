
# Wiley Edge Data Analysis Project

Olist Brazil Ecommerce Database Data Analysis

## Overview

This project involves the analysis of the Olist Brazil Ecommerce dataset sourced from Kaggle. The goal was to gain insights into the e-commerce activities, design and create a MySQL database, import CSV files into the database, and perform data cleaning, inspection, and transformation using Python. The final step involved updating the CSV files with Python and importing them into PowerBI to create visualizations that effectively communicate the data trends.

## Project Structure

The project is structured as follows:

- **Database Design and Import:**
  - Designed a relational schema for the SQL database
  - Imported the Olist Brazil Ecommerce dataset into a MySQL database.
  - Created a MySQL database to organize and store the data efficiently.

- **Data Cleaning and Transformation:**
  - Created DatabaseConnector class to connect to MySQL database, execute queries, store dataframes, and update the csv files
  - Utilized Python for data cleaning, inspection, and transformation.
  - Connected to the MySQL database using Python to retrieve and manipulate the data.
  - Updated CSV files with the cleaned and transformed data.

- **Data Visualization:**
  - Imported the cleaned data into PowerBI for creating visualizations.
  - Developed various visualizations to showcase insights from the dataset.
  - Explored trends and patterns in e-commerce activities.

## Tools Used

- MySQL: For creating and managing the database.
- Python: Used for data cleaning, manipulation, exploration, and connecting to the database.
- PowerBI: Employed for creating interactive and insightful visualizations.

## Project Files

- `project_database.sql`: SQL script for creating the MySQL database schema.
- `main.ipynb`: Jupyter Notebook containing Python code for data cleaning and transformation. Also for updating the CSV files, and performing basic data exploration.
- `mods.py`: Pyhton script with the class that hangles database connection, queries and updates.
- `/data`: folder containing each table of the database.

## Getting Started

To replicate or further explore the analysis, follow these steps:

1. **Database Creation:**
   - Execute the SQL script `database_creation.sql` to set up the MySQL database. Be sure to create the tables first and create the foreign keys after the tables have been created.
   - Run the `mods.py` Python script to create the class to handle database connection
   - Change the working directory and the database credentials to your own.

2. **Data Cleaning and Transformation:**
   - Open and run the Jupyter Notebook `main.ipynb` for data cleaning and transformation.
   - This will also show basic descriptions of the database tables to get an understanding of the data.
   - This will also update the csv files with the transformed data.

3. **Data Visualization:**
   - Open `data_visualization.pbix` using PowerBI for exploring visualizations.

## Requirements

- folium==0.15.0,
- geopandas==0.14.1
- ipykernel==6.26.0
- ipython==8.17.2
- jupyter_core==5.5.0
- matplotlib==3.8.1
- matplotlib-inline==0.1.6
- mysql-connector-python==8.2.0
- numpy==1.26.2
- pandas==2.1.3
- python-dateutil==2.8.2

## Additional features

#### - With more time, I would have like to introduce more features into the project.
   1. Adding more advanced statistical analysis using python
   2. Creating a more seemless connection between Python, PowerBI, and MySQL
   3. Creating more visually appealing dashboards in PowerBI with more advanced visuals


## Acknowledgments

- Dataset Source: [Olist Brazil Ecommerce Dataset](https://www.kaggle.com/olistbr/brazilian-ecommerce)

Feel free to add more details or sections based on specific aspects of your project. This template provides a structured starting point for a README file.