# Store Inventory My SQL Project

This is a MySQL project I built while learning SQL. Instead of creating a simple student database, I chose a basic inventory management system.

Businesses need to track products, suppliers, purchases, and sales to manage stock efficiently. This database helps organize inventory records and monitor stock movement automatically.

## What This Project Does
• Stores Product Categories

Saves different product categories such as Electronics, Groceries, and Stationery.

• Manages Suppliers

Stores supplier information including names, phone numbers, and cities.

• Stores Product Data

Keeps records of products, their prices, categories, suppliers, and available stock quantities.

• Tracks Purchases

Records products purchased and automatically increases stock levels.

• Tracks Sales

Records product sales and automatically reduces stock quantities.

• Generates Inventory Reports

Provides useful reports for stock levels, product details, and sales summaries.

Database Structure (Tables)
1. Categories

Stores product category information.

2. Suppliers

Stores supplier details.

3. Products

Stores product information including price and stock quantity.

4. Purchases

Stores purchase transactions (stock in).

5. Sales

Stores sales transactions (stock out).

SQL Concepts Used
DDL & DML

• CREATE DATABASE

• CREATE TABLE

• INSERT INTO

Data Retrieval

• SELECT

• WHERE

• GROUP BY

Joins

• INNER JOIN

Aggregate Functions

• SUM()

Advanced Features
Triggers

• AFTER INSERT Trigger for Purchases

• AFTER INSERT Trigger for Sales

Constraints

• PRIMARY KEY

• FOREIGN KEY

• NOT NULL

• DEFAULT

Sample Data Included

The project includes sample data so you can test queries easily:

• 3 Categories

• 2 Suppliers

• 3 Products

• Purchase Transactions

• Sales Transactions

• Automatic Stock Updates Using Triggers

What I Learned

• How to design and organize relational database tables

• How to create relationships using Primary Keys and Foreign Keys

• How to write JOIN queries for combining related data

• How to use aggregate functions for reporting

• How to create Triggers for automatic stock management

• How inventory systems track stock movement through purchases and sales
