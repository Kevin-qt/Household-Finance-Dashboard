# Household Finance Dashboard

### Project Statement
To unlock financial insights that were invisible before budget and savings planning.

### Objective <br>
To create an interactive dashboard which providing quick and updated financial insights to have a better understanding of household finance and be acquainted with financial literacy. 

### Rundown <br>
**1. Database Design <br>**
The project start with designing a database to store all relevant information of household members and their transaction records. The schema comprises of four entities: accounts, users, categories, and transactions. <br><[Database setup](db_setup.sql)><br>
<[Database trigger](trigger.sql)><br>

_ERD Diagram:_

![erd image](https://github.com/Kevin-qt/Household-Finance-Dashboard/blob/main/erd.jpg)

**2. ETL <br>**
Then, we use Apache Airflow and Python to schedule ETL workflow to pass data from the latest csv log into our database in a daily manner.<br>

_Workflow:_
![workflow image](https://github.com/Kevin-qt/Household-Finance-Dashboard/blob/main/workflow.jpg)

<[ETL with Airflow](airflow_etl.py)><br>

**3. Data Modeling <br>**
Before creating the dashboard, we model our data by creating a new view in the database. <br>
<[Create view](new_view.sql)><br>

**4. Creating Dashboard in PowerBI <br>**
The final step is to load our view into PowerBI and create the dashboard. <br>
<[BI Dashboard](dashboard.pbit)><br>

_Dashboard Preview:_
![preview](https://github.com/Kevin-qt/Household-Finance-Dashboard/blob/main/dashboard_preview.jpg)
