## Data Retrieval Jupyter Notebook Generator 

### Overview
This utility allows you to generate Jupyter Notebooks for each table. These notebooks include data retrieval SQL queries for selecting all records and additional information for each index key associated with the table.

### Solution Overview

![Data Retrieval Solution](/docs/images/data_retrieval_solution.png "Data Reterieval Solution Overview")

## Usage:

### Pre-requisite

- Anaconda
  - Python 3.11 +
  - Virtual Environment
  - Jupyter Lab / Notbook installed
- MySQL Database

### Steps

- Clone the repository
```bash
$ cd workspace
$ git clone https://github.com/jittakal/sql-schema-utilities.git
```
- Start Anaconda-Navigator
- Switch to newly created virtual environment
- Start Jupyter Lab
- Open Notebook
  - generate_data_retrieval_notebooks_mysql.ipynb
- Configure the cell with required database information
```
# Configure username, password and database details
db_user = "<<database-user>>"
db_password = "<<database-password>>"
db_host = "<<database-host>>"
db_port = "<<database-port>>"
db_name = "<<database-name>>"
```
- Run -> Run All Cells
- Check for HTML Generated files
  - `generated/<<DatabaseName>>/<<TableName>>.html`

### Sample Database

> Note: It is DBeaver provided sample database. 

![Music Database](/docs/images/music_er_diagram.png "Music Database ER Diagram")

### Generated Notbooks 

Checkout [Generated Notebooks](../example/mysql_v8/generated/music/) Folder.
