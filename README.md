# SQL Library Management: A Business Intelligence Project

## Project Overview

This project utilizes SQL to conduct a comprehensive business analysis for a library management system. The goal is to transform raw transactional data into actionable business insights that can help optimize operations, enhance member engagement, drive revenue, and improve overall performance. This portfolio piece demonstrates the ability to use data analysis to answer critical business questions and support strategic decision-making.

---

## Key Business Insights & Analysis

The SQL queries in this project are designed to address specific business challenges and opportunities across four key areas:

### 1. Revenue and Financial Performance

These queries focus on understanding and optimizing the library's financial health.

*   **Profitability Analysis by Category (Task 8)**: By calculating rental income per book category, we can identify the most profitable genres.
    *   **Business Insight**: This allows for data-driven purchasing decisions, ensuring investment is focused on high-demand, high-revenue categories like "Classic" fiction. It also guides promotional strategies.
*   **Branch Performance Reporting (Task 14)**: A consolidated report was created to compare branches based on key metrics like total books issued, books returned, and total revenue.
    *   **Business Insight**: This report helps management identify high-performing and underperforming branches. It serves as a foundation for resource allocation, staff training initiatives, or targeted marketing campaigns for specific branches.
*   **Pricing Strategy Analysis (Task 11)**: A new table was generated to segment premium books (rental price > $7).
    *   **Business Insight**: This segmentation helps in analyzing the performance of high-price items and understanding their contribution to revenue, informing future pricing strategies.

### 2. Member Engagement and Retention

Understanding member behavior is crucial for increasing loyalty and satisfaction.

*   **Identifying Overdue Books and Members (Task 13)**: This query pinpoints members with overdue books.
    *   **Business Insight**: Proactively identifying overdue rentals enables targeted reminders, which can reduce asset loss, minimize negative impacts on book availability for other members, and prevent member churn.
*   **Tracking New Member Acquisition (Task 9)**: The query lists members who registered in the last 180 days.
    *   **Business Insight**: This provides a clear view of member growth trends and the effectiveness of recent marketing campaigns. This cohort can be targeted with welcome offers to foster long-term engagement.
*   **Defining Active Members (Task 15)**: A new table `active_members` was created to identify users who borrowed a book in the last two months.
    *   **Business Insight**: This helps segment the user base to distinguish active users from inactive ones. Marketing can then focus on re-engaging the inactive segment and rewarding the loyal, active members.
*   **Maintaining Data Accuracy (Task 2)**: This task demonstrates updating member information.
    *   **Business Insight**: Accurate member data is fundamental for effective communication and personalized service, directly impacting member satisfaction.

### 3. Operational Efficiency and Inventory Management

These queries streamline daily operations and optimize the management of the library's primary asset: its books.

*   **Tracking Available Inventory (Task 12)**: This query identifies which books have been checked out but not yet returned.
    *   **Business Insight**: This provides a real-time view of the library's on-loan assets, helping staff manage inventory, anticipate demand, and inform members about book availability.
*   **Catalog Management (Tasks 1, 7)**: These tasks involve adding new books to the catalog and retrieving books by category.
    *   **Business Insight**: Efficient catalog management ensures the library's collection is fresh, relevant, and easily accessible, which directly enhances the member experience.
*   **Data Integrity and Cleanup (Task 3 & Pre-analysis Steps)**: Orphaned records in the `return_status` table were identified and deleted to maintain data integrity.
    *   **Business Insight**: Clean and reliable data is the bedrock of accurate analysis. This demonstrates a crucial step in any data-driven project to ensure insights are based on a trustworthy source.

### 4. Employee and Staff Performance

Analyzing employee activity helps in recognizing top performers and managing workload.

*   **Identifying Top-Performing Employees (Task 16)**: The query ranks the top 3 employees based on the number of book issues they processed.
    *   **Business Insight**: This provides a clear, quantitative metric for employee performance reviews and recognition programs. It can also highlight training needs for other staff.
*   **Analyzing Employee Workload (Task 5)**: This query identifies employees who have handled a high volume of transactions.
    *   **Business Insight**: Understanding workload distribution helps managers allocate tasks more effectively and ensure operational bottlenecks are addressed.
*   **Enhancing Team Collaboration (Task 10)**: This query maps employees to their respective managers and branch locations.
    *   **Business Insight**: This provides organizational clarity and helps in understanding team structures, which is useful for communication and management purposes.

---

## Database Schema

The analysis is built upon a relational database schema designed to capture all key aspects of library operations:

*   **`branch`**: Information on each library branch.
*   **`employees`**: Employee details and their assigned branch.
*   **`books`**: The complete book catalog.
*   **`members`**: Registered library member information.
*   **`issued_status`**: Transactional data for every book issued.
*   **`return_status`**: Transactional data for every book returned.

Foreign key constraints are used to ensure referential integrity across the tables, forming the basis for reliable analysis.

---
