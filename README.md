# SQL Library Management System Project

This project demonstrates a comprehensive SQL database for a library management system. It includes the schema design, table creation, and a series of queries to perform various data manipulation and analysis tasks. The database is designed to manage information about library branches, employees, books, members, and book lending transactions.

### Database Schema

The database consists of six main tables that are linked using primary and foreign keys to ensure data integrity.

*   **branch**: Stores information about each library branch, including its ID, manager, address, and contact number.
*   **employees**: Contains details about library employees, such as their ID, name, position, salary, and the branch they work at.
*   **books**: A catalog of all books in the library, including ISBN, title, category, rental price, availability status, author, and publisher.
*   **members**: Holds information about registered library members, including their ID, name, address, and registration date.
*   **issued_status**: Tracks every book checkout transaction, linking the book, the member who borrowed it, the employee who processed it, and the date of issue.
*   **return_status**: Records the return of a book, linking back to the original issue transaction and noting the return date.

### SQL Scripts and Tasks

The SQL script performs a variety of operations, from initial setup to complex data analysis. The key tasks demonstrated in this project are:

*   **Task 1: Create a New Book Record**: Inserts a new book into the `books` table.
*   **Task 2: Update a Member's Address**: Modifies the address of an existing member in the `members` table.
*   **Task 3: Delete an Issued Record**: Removes a specific book issue record from the `issued_status` table.
*   **Task 4: Retrieve Books Issued by an Employee**: Selects all book issue records processed by a specific employee.
*   **Task 5: List Employees with Multiple Book Issues**: Uses `GROUP BY` and `HAVING` to find employees who have processed more than one book issue.
*   **Task 6: Create a Book Issue Summary Table**: Uses `CREATE TABLE AS SELECT` (CTAS) to generate a new table summarizing the total number of times each book has been issued.
*   **Task 7: Retrieve Books by Category**: Filters and retrieves all books belonging to a specific category.
*   **Task 8: Calculate Total Rental Income by Category**: Aggregates data to show the total rental income generated from each book category.
*   **Task 9: List Recently Registered Members**: Identifies and lists members who have registered within the last 180 days.
*   **Task 10: List Employees with Manager and Branch Details**: Joins multiple tables to display a report of employees, their managers, and their branch addresses.
*   **Task 11: Create a Table of High-Priced Books**: Uses CTAS to create a new table containing books with a rental price above a specified threshold ($7).
*   **Task 12: List Books Not Yet Returned**: Finds all books that have been issued but do not yet have a corresponding return record.
*   **Task 13: Identify Members with Overdue Books**: Identifies members who have books overdue, assuming a 30-day lending period.
*   **Task 14: Generate a Branch Performance Report**: Creates a report summarizing the performance of each branch, including the number of books issued, returned, and total revenue.
*   **Task 15: Create a Table of Active Members**: Uses CTAS to create a new table of "active members" who have borrowed at least one book within a specific two-month period.
*   **Task 16: Find Top Employees by Book Issues**: Ranks employees based on the number of book issues they have processed and lists the top three.

### How to Use

1.  **Setup Database**: Use a SQL client (such as MySQL Workbench, DBeaver, or command line) to connect to your database server.
2.  **Create Database**: Run the `CREATE DATABASE sql_project_2;` and `USE sql_project_2;` commands.
3.  **Execute Script**: Run the entire SQL script provided in the `.sql` file. This will create the tables, define relationships, and perform the analytical queries.
4.  **Load Data**: The script assumes data is loaded into the tables. The provided data import steps (like `set foreign_key_checks = 0;`) handle potential foreign key issues during manual data loading.
5.  **Review Results**: Observe the output of each `SELECT` statement to see the results of the queries and the contents of the newly created tables.
