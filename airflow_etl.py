from datetime import datetime, timedelta
import numpy as np
import pandas as pd
import os

from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.email import EmailOperator

default_args = {
    "owner": "kevin",
    "email": ["kevin@email.com"],
    "email_on_failure": True,
    "email_on_retry": True,
    "retries": 5,
    "retry_delay": timedelta(minutes=5)
}

def getMostRecent(ti):
    # find the latest csv from a designated directory
    path = "."
    csv_arr = [file for file in os.listdir(path) if file.endswith(".csv")]
    last_modified = max(csv_arr, key=lambda x: os.path.getmtime(os.path.join(path, x)))
    file_path = os.path.join(path, last_modified)
    ti.xcom_push(key="file_path", value=file_path)

def etl(ti):
    # load data
    file_path = ti.xcom_pull(task_ids="get_most_recent_file", key="file_path")
    df = pd.read_csv(file_path, encoding="iso-8859-1")
    # rename columns to match the db schema
    df.rename(columns={'ï»¿Date':'TransactionDate', 'Categories':'CategoryID', 'Person':'UserID'}, inplace=True)
    # mapping
    category_mapping = {'Income': 1, 'Groceries ': 2, 'Transport': 3,
                        'Dineout': 4, 'Beauty': 5, 'Furniture': 6,
                        'Household': 7, 'Kitchen': 8, 'Rent': 9,
                        'Entertainment': 10, 'Miscellaneous': 11}
    user_mapping = {'Kevin': 1, 'Nicole': 2}
    df['CategoryID'] = df['CategoryID'].map(category_mapping)
    df['UserID'] = df['UserID'].map(user_mapping)
    # convert datetime
    df['TransactionDate'] = pd.to_datetime(df['TransactionDate'], format='%m/%d/%Y')
    # update db
    myhost = os.environ.get('MYSQLHOST')
    myuser = os.environ.get('MYSQLUSER')
    mypassword = os.environ.get('MYSQLPASS')
    my_db = 'householdfinance'
    # establish connection to the database
    mydb = mysql.connector.connect(
        host=myhost,
        user=myuser,
        password=mypassword,
        database=my_db
    )
     # create a cursor
    cursor = mydb.cursor()
    # define the query
    sql_query = 'INSERT INTO transactions (TransactionDate, CategoryID, Description, Amount, UserID) VALUES (%s, %s, %s, %s, %s)'
    # define the values to be inserted
    values = list(df.itertuples(index=False, name=None))
    for value in values:
        cursor.execute(sql_query, value)
    # commit changes
    mydb.commit()
    # close the cursor and connection
    cursor.close()
    mydb.close()

with DAG(
    dag_id="update_db_workflow",
    default_args=default_args,
    description="Update db with airflow",
    start_date=datetime(2023, 5, 1),
    schedule_interval="@weekly"
) as dag:

    get_recent_file = PythonOperator(
        task_id="get_most_recent_file",
        python_callable=getMostRecent
    )

    etl_update = PythonOperator(
        task_id="etl_update",
        python_callable=etl
    )

    send_email = EmailOperator(
        task_id="send_email",
        to="recipient@email.com",
        subject="Workflow notification",
        html_content="Db update successfully"
    )

    get_recent_file >> etl_update >> send_email