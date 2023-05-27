# Household Finance Dashboard

## Project Statement
To unlock financial insights that were invisible before budget and savings planning.

### Objective: <br>
To create an automated dashboard providing quick and updated financial insights to have a better understanding of household finance and be acquainted with financial literacy. To automate the process of moving data from multiple sources to a database at batch processing.

### Rundown: <br>
**1. Database Design <br>**
The project start with designing a database to store all relevant information of household members and their transaction records. The schema comprises of four entities: accounts, users, categories, and transactions. <br><br>
ERD Diagram:

![erd image](https://github.com/Kevin-qt/Household-Finance-Dashboard/blob/child/erd.jpg)

**2. ETL <br>**
Then, we use python to perform the ETL process to load and cleanse data from the original csv log into our new database. <br>

**3. Data Modeling <br>**
Before creating the dashboard, we model our data by creating a new view in the database. <br>

**4. Creating Dashboard in PowerBI <br>**
The final step is to load our view into PowerBI and create the dashboard. <br><br>
Dashboard Preview:
![preview](https://github.com/Kevin-qt/Household-Finance-Dashboard/blob/child/dashboard_preview.jpg)
