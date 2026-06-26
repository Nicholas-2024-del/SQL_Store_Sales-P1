Create database Retail_Sales;

Select * from store_sales;

--Data cleaning
select * 
from store_sales 
where 
customerid is null
or
age is null
or
gender is null
or
category is null
or
itempurchased is null
or
amount is null
or 
season is null
or
paymentmethod is null
or
itemrating is null
or
discountapplied is null
or
previouspurchases is null;

Delete from store_sales
where 
customerid is null
or
age is null
or
gender is null
or
category is null
or
itempurchased is null
or
amount is null
or 
season is null
or
paymentmethod is null
or
itemrating is null
or
discountapplied is null
or
previouspurchases is null;

--Data exploration

--How many sales we have?

Select count(*) as Total_Sales from store_sales; 

--How many unique customers do we have?

Select count(Distinct customerid) as Total_Customers from store_sales; 

--How many categories do we have?

Select count(Distinct category) as Category_Type from store_sales;

Select Distinct category as Category_Type from store_sales
order by category asc;

--Data Analysis, Business problems amd Answers

-- Q1. Write a SQL query to retrieve all columns for sales made on winter season? 

Select * from store_sales
where
    season = 'winter';

--Q2. Write a SQL querry to retrieve all transactions where the category is 'Groceries' and the item rating is more than 3.5?

Select * from store_sales
where
category='groceries'
and 
itemrating > 3.5;

--Q3. Write a SQL querry to calculate Total Purchases for each item order by well performing to the least performing?

Select Category, 
sum(amount) as Gross_Total_Revenue,
Count (*) as Purchase_Oders from store_sales
group by Category
order by Gross_Total_Revenue desc;

--4. Write a SQL querry to find average age of customers who purchased items from the 'Beauty' category?

Select 
avg(age) as Average_Age 
from store_sales
where category = 'Beauty';

--Q5. Write a SQL querry to find all transactions where total_Sale is greater than 500?

Select * from store_sales
where
Amount>2500;

--Q6. Write a SQL querry to find the total number of transactions made by each gender in each category? 

Select gender, category,  

count (*) as Total_Transactions

from store_sales

group by 
      category, gender 
order by 
      category;

--Q7. Write a SQL querry calculate the average sale for each category?

Select category, 
Round (Avg(amount),2) as Average_Sale
from store_sales
Group by category;

--Q8. Write a SQL querry to find out the top 5 performing categories based on the highest total sales?

Select  top 5 category, 
Round (sum(Amount),2) as Total_Sales from store_sales 
Group by category
order by Total_Sales Desc;

--Q9. Write A SQL querry to find out the number of the customers who purchased same items?

Select Category,
Count(customerID) as Number_Customers
from store_sales
Group by category;


--End of Project...

