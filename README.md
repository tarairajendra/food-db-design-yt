# 🍽️ SQL Assignment — Online Food Delivery System

## 🎯 Overview

Design a **relational database** for a simplified **Online Food Delivery System** (like Swiggy/Zomato).

The system should support:

- Users (customers and delivery agents)
- Restaurants and menu items
- Orders and order items
- Delivery assignments
- Customer and delivery agent reviews
- Order status tracking (audit logs)

This challenge is designed to test your **database modeling, querying, and analysis skills**.

---

## 🧩 Functional Requirements

Your database should include tables for:

### 1. Users
- Information about customers and delivery agents
- Example fields: full name, email, phone number, type, address

### 2. Restaurants
- Information about restaurants
- Example fields: name, address, active status

### 3. Menu Items
- Each restaurant has multiple menu items
- Example fields: name, price, category, availability

### 4. Orders
- Orders placed by customers at restaurants
- Example fields: user reference, restaurant reference, status, timestamps for each stage, payment method, delivery instructions

### 5. Order Items
- Each order contains multiple items
- Example fields: order reference, menu item reference, quantity, price at purchase

### 6. Delivery Assignments
- Orders assigned to delivery agents
- Example fields: order reference, agent reference, status, assigned time, pickup time, drop time, expected drop time

### 7. Reviews
- Customers can review restaurants or delivery agents
- Example fields: reviewer reference, restaurant reference, delivery agent reference, rating, comment

### 8. Order Status Logs
- Tracks changes in order status
- Example fields: order reference, status, change time

---

## 📝 Tasks

### **Task 1: Database Schema**
- Design tables for all entities above
- Include primary keys, foreign keys, and relationships (one-to-many, many-to-many)
- Add constraints and indexes where necessary

---

### **Task 2: Seed Data**
Create realistic sample data:

- 10 Users (customers + delivery agents)
- 5 Restaurants
- 20 Menu Items
- 30 Orders
- 60 Order Items
- 15 Delivery Assignments
- 20 Reviews
- Audit logs for order status changes

---

### **Task 3: SQL Challenges**
Write SQL queries to answer the following:

| # | Challenge | Difficulty |
|---|-----------|-----------|
| 1 | Average delivery time per restaurant | 🟡 Medium |
| 2 | Top-selling menu items this month | 🟡 Medium |
| 3 | Restaurants with average rating below 3 in last 30 days | 🔴 Hard |
| 4 | Delivery agent with highest on-time delivery rate | 🔴 Hard |
| 5 | Full order life-cycle breakdown for a given order | 🟡 Medium |
| 6 | Customers who cancelled more than 3 orders this year | 🟡 Medium |
| 7 | Restaurants with no orders in the last 7 days | 🟢 Easy |
| 8 | Most active delivery agent in last 7 days | 🟢 Easy |
| 9 | Orders that took more than 45 minutes after acceptance | 🔴 Hard |
| 10 | Customers who order repeatedly from the same restaurant (≥3 times) | 🟡 Medium |

---

### **Task 4: Bonus Challenges (Optional)**
- Average rating per delivery agent
- Customers with the highest total spend
- Detect delayed deliveries (>1 hour) for a specific restaurant
- Monthly revenue per restaurant

---

## 📂 Submission Instructions
- Submit a single `.sql` file containing:
  1. Table creation scripts
  2. Seed data insertion scripts
  3. SQL queries for all 10 challenges

- Bonus: Add comments explaining each query and its purpose

---

## 🔑 Learning Outcomes
By completing this assignment, students will:

- Practice **complex database design**
- Work with **many-to-many and one-to-many relationships**
- Handle **temporal tracking** and **audit logs**
- Write **advanced SQL queries** with aggregation, filtering, and joins
- Gain confidence for **interview-style database questions**
