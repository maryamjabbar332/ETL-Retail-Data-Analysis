# Retail Orders Data Analysis Using Python and SQL

## Overview

This project explores a retail orders dataset using Python and Microsoft SQL Server. It demonstrates data preparation, ETL fundamentals, SQL querying and sales performance analysis.

The workflow uses Python to prepare the raw dataset and load the processed data into SQL Server, where SQL queries are used to investigate product performance, regional sales and year-on-year trends.

**Project type:** Guided learning project

## Tools and Technologies

- Python
- pandas
- SQLAlchemy
- Microsoft SQL Server
- SQL
- Kaggle API

## Project Workflow

### 1. Data Extraction and Preparation

Python and pandas were used to download and load the retail orders dataset.

The preparation process included:
- Handling specified placeholder values such as "Not Available" and "Unknown".
- Standardising column names to lowercase with underscores.
- Calculating discount amounts, sale prices and profits.
- Converting order dates into datetime format.
- Removing intermediate pricing columns that were no longer required.

### 2. Loading Data into SQL Server

The processed dataset was loaded into SQL Server using pandas and SQLAlchemy.

A destination table was created with specified column types before the prepared records were appended to it.

### 3. SQL Analysis

SQL queries were written to answer several business questions:

- Which 10 products generated the highest sales revenue?
- Which five products had the highest sales in each region?
- How did monthly sales in 2022 compare with the corresponding months in 2023?
- Which month recorded the highest sales for each product category?
- Which product subcategory experienced the highest year-on-year growth?

The queries use aggregation, Common Table Expressions (CTEs), conditional aggregation and window functions, including `ROW_NUMBER()`.

## Skills Demonstrated

- Data cleaning and transformation
- Handling missing or inconsistent values
- Calculated fields and date conversion
- Loading structured data into a relational database
- SQL aggregations and grouping
- CTEs and window functions
- Ranking and comparative analysis
- Translating business questions into analytical queries

## Learning Outcomes

This project provided practical exposure to a Python-to-SQL data workflow and strengthened my understanding of how prepared datasets can be used to answer business questions through SQL.

As a guided learning project, it also provided an opportunity to practise data transformation, database loading and analytical querying.

## Future Improvements

Potential extensions include:
- Validating data types and checking for duplicate order identifiers before loading.
- Handling division-by-zero cases in year-on-year growth calculations.
- Adding tests to validate transformation logic.
- Building a dashboard to visualise product and regional sales performance.
- Extending the analysis to investigate unusual transactions and potential anomalies.
