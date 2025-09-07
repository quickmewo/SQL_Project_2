# SQL Library Management: A Business Intelligence Project

## Overview
This project uses SQL to analyze library operational data, transforming raw transactions into actionable business insights. The analysis targets four core areas: **Revenue Performance, Member Engagement, Operational Efficiency,** and **Staff Performance**, demonstrating how data can solve real-world business challenges.

## Key Insights & Analysis

### 1. Revenue & Financial Performance
- **Identified Profitable Categories**: Pinpointed top-earning book categories to guide purchasing budgets and promotional efforts.
- **Evaluated Branch Performance**: Ranked branches by key metrics (issues, returns, revenue) to inform resource allocation and share best practices.
- **Analyzed Pricing Strategy**: Segmented premium-priced books (>$7) to assess their revenue contribution and support future pricing decisions.

### 2. Member Engagement & Retention
- **Targeted Risk & Opportunity**: Identified members with overdue books for targeted reminders, reducing asset loss. Also tracked new member acquisition (last 180 days) to measure marketing effectiveness and defined "active members" for targeted retention campaigns.
- **Ensured Data Accuracy**: Maintained clean data (e.g., updated member info, removed orphaned records) to guarantee reliable analysis and outreach.

### 3. Operational Efficiency & Inventory Management
- **Optimized Inventory Turnover**: Gained a real-time view of book availability by tracking on-loan items, improving stock management and member service.
- **Enhanced Catalog Value**: Ensured a fresh and relevant collection through efficient catalog management, directly improving the member experience.

### 4. Staff Performance & Team Management
- **Quantified Employee Performance**: Identified top-performing staff by transaction volume to guide recognition programs and balance workloads.
- **Clarified Organizational Structure**: Mapped relationships between employees, managers, and branches to streamline internal communication.

## Database Schema
The analysis is built on a relational model with six core tables, using foreign keys to ensure data integrity.
- `branch`
- `employees`
- `books`
- `members`
- `issued_status`
- `return_status`
