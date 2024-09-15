# Fufu Republic Restaurant Chain Data Modeling.

## Overview
Fufu Republic is a popular restaurant chain in Nigeria with multiple outlets nationwide. While the
core menu is standardized, some items vary by location (e.g., the Agege branch may sell
Chinese Rice, while the Lekki branch might not). Customers can order online through the
website or visit outlets for dine-in or take-out.

Payment Methods:

The restaurant accepts:
- Cash
- Debit card payments via Nomba POS terminals at outlets
- Online payments processed through gateways like Nomba Web Checkout, Paystack,
Interswitch etc.

## Challenges
**1. Inventory Management:**
Variations in customer demand and menu items across branches make it challenging to
maintain optimal stock levels.

**2. Customer Experience:**
The restaurant aims to improve the customer experience by offering personalized
promotions based on purchasing behavior.

## Objective:

Fufu Republic wants to leverage data to:

- Understand sales trends across locations, payment methods, and dining options
(dine-in, take-out, online).
- Manage stock levels efficiently, reducing waste and ensuring availability.
- Enhance customer experience by analyzing purchasing habits and tailoring promotions
accordingly.

As a recently hired data engineer at Fufu Republic, you have been tasked with developing a
dimensional model to address the business's needs for data-driven decision-making.

1. Map out the necessary entities ,relationships and constraints
2. Create a dimensional model:
- Identify a business process of your choice.
- List the business question under the business process you selected.
- Identify the grain, dimensions and fact.

# Solution
## Understanding Fufu Republic Restaurant Chain.
![](https://github.com/Samuel-Njoroge/fufu-republic-data-modeling/blob/main/fufu-republic-restaurants.png)

## Entities
`1. Branch :` Restaurant in different areas.

`2. Customer :` An individual who buys from any of the branch.

`3. Order :` Customer's request.

`4. Order_item :` Item requested by  customer.

`5. Menu_item :` List of dishes sold in the branch.

`6. Inventory :` Stock levels of the dishes.

`7. Payment_method :` Mode of payment.

## Entity Relationship Diagram.
![](https://github.com/Samuel-Njoroge/fufu-republic-data-modeling/blob/main/fufu-republic-data-model.png)

## Sales Process
### Key Questions
1. What are the sales trends across different locations?
2. How do sales vary by payment method?
3. What is the popularity of different dining options (dine-in, take-out, online)?
4. Which menu items are the best sellers?
5. How do sales vary by time (hour, day, month, season)?

## Grain: Individual order item
## Dimensions
1. Date Dimension
2. Branch Dimension
3. Customer Dimension
4. Menu Item Dimension
5. Payment Method Dimension
6. Order Type Dimension

## Fact
1. Sales amount

## Star Schema
![](https://github.com/Samuel-Njoroge/fufu-republic-data-modeling/blob/main/star-schema.png)

# Usage
### Creating the database using `data-model.sql` file.
1. Clone the repository.
```sh
git clone https://github.com/Samuel-Njoroge/fufu-republic-data-modeling
```

2. Open Terminal or Command Prompt.

3. Log into PostgreSQL
```sh
psql -U your_username
```
4. Create a new database. 
```sh
CREATE DATABASE fufu_republic;
```
5. Connect to the new database.

```sh
\c fufu_republic
```

6. Run the `data-model.sql` file.
```sh
\i data-model.sql
```

7. Verify table creation.
```sh
\dt
```

