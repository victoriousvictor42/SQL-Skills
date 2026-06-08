# SQL-Skills

This repository contains a comprehensive set of SQL scripts designed to practice and demonstrate core SQL concepts. It includes database schema creation, sample data insertion, and a wide variety of query operations ranging from basic filtering and string manipulation to advanced aggregations, joins, subqueries, and views.

---

## 📊 Database Schema

The script sets up a relational schema consisting of three main tables:

### 1. `worker`

Stores core employee information.

* **`worker_id`**: Primary Key.
* **`first_name` / `last_name**`: Employee names.
* **`salary`**: Monthly/Annual compensation.
* **`joining_date`**: Timestamp of hiring.
* **`department`**: Assigned organizational unit (e.g., HR, Admin, Account).

### 2. `title`

Tracks corporate roles and designations.

* **`worker_ref_id`**: Foreign Key referencing `worker(worker_id)` with cascading deletes.
* **`worker_title`**: Job title (e.g., Manager, Executive, Lead).
* **`affected_from`**: Date the title became effective.

### 3. `job_grade`

A reference table defining salary brackets and corresponding grade levels (Grades A to F).

---

## 🔍 Covered SQL Concepts & Queries

The practice script features **35+ practical SQL queries** categorized by complexity and function:

### Basic Filtering & String Manipulation

* Modifying text outputs (`UPPER`, `REPLACE`, `CONCAT` for full names).
* Pattern matching using wildcards (`LIKE` for specific prefixes, suffixes, and lengths).
* Range filtering (`BETWEEN`) and set matching (`IN` / `NOT IN`).

### Aggregations & Grouping

* Row counts per department.
* Conditional group filtering using the `HAVING` clause (e.g., identifying departments with fewer than 5 employees).
* Summing and averaging financial metrics (`SUM`, `AVG`).

### Advanced Analytical Queries

* **Subqueries**: Fetching the absolute highest earners.
* **DENSE RANK Alternatives**: Finding the $n^{th}$ highest salary using custom offsets (`LIMIT 2, 1`).
* **Set Operations**: Utilizing `UNION ALL` to duplicate intentional row results for reporting.

### Joins & Database Objects

* Multi-table queries pairing workers with their respective titles and salary grade scales based on non-equi joins (`BETWEEN`).
* Creation of an isolated Database View (`CREATE VIEW`) specifically filtering for HR personnel.

---

## 🚀 Getting Started

### Prerequisites

Any relational database management system (RDBMS) supporting standard SQL (optimized for MySQL syntax due to functions like `now()`, `CURDATE()`, and `LIMIT`).

### Execution

1. Clone or copy the contents of the SQL file.
2. Run the table creation and insertion sections first to populate your local database environment.
3. Execute the analytical queries individually to observe data transformations and results.
