SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM return_status;
SELECT * FROM members;

-- Project Task

-- Task 1. Create a New Book1 Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into books(isbn, book_title, category, rental_price, status, author, publisher)
values 
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books;

-- Task 2: Update an Existing Member's Address
Update members
set member_address ='125 Main St'
where member_id='C101';
SELECT * FROM members;

-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
delete from issued_status
where issued_id = 'IS121';
SELECT * FROM issued_status;

-- Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
select * from issued_status
where issued_emp_id = 'E101';

-- Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.
select
i.issued_emp_id,
e.emp_name,
count(*) as issued_count
from issued_status as i
inner join employees as e
on e.emp_id = i.issued_emp_id
group by i.issued_emp_id,e.emp_name
having count (i.issued_id) > 1;

-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results 
-- each book and total book_issued_cnt
create table book_cnt
as
select b.isbn, b.book_title, count(i.issued_id) as book_issued_cnt
from books b 
join issued_status i
on i.issued_book_isbn = b.isbn
group by b.isbn, b.book_title;

select * from book_cnt;

-- Task 7: Retrieve All Books in a Specific Category
select * from books
where category = 'Classic';

-- Task 8: Find Total Rental Income by Category
select category, sum(b.rental_price) as total_rental_price, count(i.issued_id) as total_issued_cnt
from books b 
join issued_status i
on b.isbn = i. issued_book_isbn
group by category
order by total_rental_price desc;

-- Task 9: List Members Who Registered in the Last 180 Days
INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES
('C120', 'Amy', '145 Main St', '2025-06-01'),
('C121', 'Alice', '133 Main St', '2025-05-01');

select * from members
where datediff(CURRENT_DATE, reg_date) <= 180;

-- task 10: List Employees with Their Branch Manager's Name and their branch details
select e1.emp_id, e1.emp_name, e2.emp_name as manager, b.branch_address
from employees e1
join branch b on e1.branch_id = b.branch_id
join employees e2 on b.manager_id = e2.emp_id;


-- Task 11: Create a Table of Books with Rental Price Above a Certain Threshold 7 USD
create table books_price_greater_than_seven as 
select * from books
where rental_price > 7;
select * from books_price_greater_than_seven;

-- Task 12: Retrieve the List of Books Not Yet Returned
select DISTINCT b.book_title
 from issued_status i
left join  books b 
on b.isbn = i.issued_book_isbn
left join return_status r
on i.issued_id = r.issued_id
where r.issued_id is null;

/* Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). 
Display the member's_id, member's name, book title, issue date, and days overdue. */
select * from members;
select * from issued_status;
select * from return_status;
select *
from issued_status as ist
left join members as m
on ist.issued_member_id = m.member_id
left join books as b
on ist.issued_book_isbn = b.isbn
left join return_status as rs
on ist.issued_id = rs.issued_id
where (rs.return_date is null and DATEDIFF('2024-05-01', ist.issued_date) > 30)


/*
Task 14: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.
*/

select  b.branch_id,
        count(i.issued_id) as issued_books_cnt,
        count(r.return_id) as returned_books_cnt,
        sum(bk.rental_price) as total_revenue
from issued_status as i
left join employees as e
on i.issued_emp_id = e.emp_id
left join branch as b
on e.branch_id = b.branch_id
left join return_status as r
on i.issued_id = r.issued_id
left join books as bk
on i.issued_book_isbn = bk.isbn
group by b.branch_id
order by b.branch_id;

-- Task 15: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.
create table active_members
as
select m.member_id, m.member_name,
count(i.issued_id) as issued_books_count
 from members as m
join issued_status as i
on m.member_id = i.issued_member_id
where i.issued_date between  date_sub('2024-06-01', interval 2 month) and  '2024-6-01' 
group by m.member_id, m.member_name
having count(i.issued_id) > 0;

-- Task 16: Find Employees with the Most Book Issues Processed
-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.
select e.emp_id,
    e.emp_name,
    b.branch_id,
    count(i.issued_id) as books_processed_cnt
from issued_status as i
join employees as e
on i.issued_emp_id = e.emp_id
join branch as b
on e.branch_id = b.branch_id
group by e.emp_id, e.emp_name
order by count(i.issued_id) desc
limit 3

/*
Task 18: Stored Procedure Objective: 

Create a stored procedure to manage the status of books in a library system. 

Description: Write a stored procedure that updates the status of a book in the library based on its issuance. 

The procedure should function as follows: 

The stored procedure should take the book_id as an input parameter. 

The procedure should first check if the book is available (status = 'yes'). 

If the book is available, it should be issued, and the status in the books table should be updated to 'no'. 

If the book is not available (status = 'no'), the procedure should return an error message indicating that the book is currently not available.
*/