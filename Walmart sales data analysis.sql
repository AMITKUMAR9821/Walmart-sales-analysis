use salesdatawalmart

select * from salesdata

--\\ _______________Perfoming EDA___________________________//




--//_________Generic quetions______________//


--how many unique cities and branch does the data have ?

select distinct(city) from salesdata

select distinct(branch) from salesdata

--In which city is each branch ?

select distinct 
		(City),
		Branch
from salesdata



--________________Product based quetions___________--

--how many distinct value product line does the data have ?

select count(distinct Product_line) as Distinct_products
from salesdata;


-- What is the most common used payment method ?

select Payment,
		count(payment) as cnt
from salesdata
group by payment
order by cnt desc ;


-- What is the most selling product line ?

select Product_line,
		count(Product_line) as cnt
from salesdata
group by Product_line
order by cnt desc ;


-- What is the total revenue by month ?

select Month_name as month,
		sum(Total) as Total_sales
from salesdata
group by Month_name
order by Total_sales desc;


-- What product line had the largest revenue ?

select Product_line,
		sum(total) as Total_revenue
from salesdata
group by Product_line
order by Total_revenue desc;


-- Which branch sold more product then average product sold ?

select Branch,
		sum(Quantity) as qty
from salesdata
group by Branch
having sum(quantity) > (select avg(Quantity) from salesdata);



-- _____________________sales related questions___________________


-- Which of the customer type brings the most revenue ?

select Customer_type,
		sum(total) as Total_revenue
from salesdata
group by Customer_type
order by Total_revenue desc;


-- Which customer type pays the most in VAT ?

select Customer_type,
		avg(Tax_5) as VAT
from salesdata
group by Customer_type
order by VAT desc;



-- ______________________Customer related questions_________________________


-- What is the gender of most of the customers

select Gender,
		count(*) as Gender_cnt
from salesdata
group by Gender
order by Gender_cnt desc;


-- What is the gender distribution by branch ?

select Gender,
		count(*) as Gender_cnt
from salesdata
where Branch = 'A'
group by Gender
order by Gender_cnt desc;


--Which time customers gives the most ratings ?

select Time_of_day,
		AVG(Rating) as avg_rating
from salesdata
group by Time_of_day  
Order by avg_rating desc;