-- create branch table
drop table if exists branch;
create table branch
(
    branch_id	varchar(10) primary key,
    manager_id	varchar(10),
    branch_address	varchar(55),
    contact_no  varchar(20)
);

-- create employees table
drop table if exists employees;
create table employees
(
    emp_id	varchar(10) primary key,
    emp_name	varchar(50),
    position	varchar(25),
    salary	float,
    branch_id   varchar(10) -- fk
)

-- create books table
drop table if exists books;
create table books
(
    isbn	varchar(30) primary key,
    book_title	varchar(100),
    category	varchar(25),
    rental_price	float,
    status    varchar(10),
    author	varchar(50),
    publisher varchar(50)
);

-- create members table
drop table if exists members;
create table members
(
    member_id	  varchar(10) primary key,
    member_name	  varchar(50),
    member_address varchar(75),
    reg_date   date
);

-- create issued_status table
drop table if exists issued_status;
create table issued_status
(
    issued_id	varchar(10) primary key,
    issued_member_id	  varchar(10), -- fk 
    issued_book_name	  varchar(100),
    issued_date	date,
    issued_book_isbn	  varchar(30), -- fk
    issued_emp_id	varchar(10) -- fk
);

-- create return_status table
drop table if exists return_status;
create table return_status
(
    return_id	varchar(10) primary key,
    issued_id	varchar(10), -- fk
    return_book_name	varchar(100),
    return_date	date,
    return_book_isbn	varchar(30) -- fk
);

-- add foreign key constraints
alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_issued_id
foreign key (issued_id)
references issued_status(issued_id);

alter table return_status
add constraint fk_return_books
foreign key (return_book_isbn)
references books(isbn);

