# MySQL Database Utilities

Two utilities are provided for working with MySQL databases: one for exporting schema information as HTML and another for exporting table relations, provided certain naming conventions are followed.

## Export Schema Information

The notebook `export_schema_mysql.ipynb` utility allows you to retrieve detailed schema information for tables in a MySQL database and export it to an HTML file. This information includes column names, data types, constraints, and more.

## Export Table Relations

The notebook `export_table_relations.ipynb` utility helps you identify and export table relations within a MySQL database. It discovers relationships between tables based on shared primary key columns and generates an HTML file. This can be useful for understanding the database's tables and relations.

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
  - export_schema_mysql.ipynb
  - export_table_relations_mysql.ipynb
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
- Check for HTML files
  - `generated/music_schema_information.html`
  - `generated/music_table_relations.html`

## Sample Database

> Note: It is DBeaver provided sample database. 

![Music Database](/docs/images/music_er_diagram.png "Music Database ER Diagram")

### Generated HTML Files

- [Schema Information](../example/mysql_v8/generated/mysql_schema_information.html)
- [Table Relational Information](../example/mysql_v8/generated/mysql_table_relations.html)

