#!/usr/bin/python3
"""
Lists all states from the database hbtn_0e_0_usa.
"""
import sys
import MySQLdb

if __name__ == "__main__":
    # Get database connection credentials from command line arguments
    mysql_username = sys.argv[1]
    mysql_password = sys.argv[2]
    db_name = sys.argv[3]

    # Connect to the MySQL server running on localhost at port 3306
    db = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=mysql_username,
        passwd=mysql_password,
        db=db_name
    )

    # Create a cursor object to execute SQL queries
    cursor = db.cursor()

    # Execute the SQL query to select all states, ordered by id ascending
    cursor.execute("SELECT * FROM states ORDER BY id ASC")

    # Fetch all the rows from the executed query
    query_rows = cursor.fetchall()

    # Display the results exactly as shown in the example
    for row in query_rows:
        print(row)

    # Close the cursor and the database connection
    cursor.close()
    db.close()

