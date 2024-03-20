create database salesdatawalmart
use salesdatawalmart
exec sp_rename '[WalmartSalesData.csv]', 'salesdata';
EXEC sp_rename 'WalmartSalesData', 'salesdata';

select * from salesdata

	
--//_________________ making a coloumn with time_of_day________________//

SELECT
    time,
    CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning' 
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS Time_of_day
FROM salesdata;

ALTER TABLE salesdata 
ADD Time_of_day VARCHAR(20);

update salesdata
	set Time_of_day=(CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning' 
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
	);


select * from salesdata


--\\ __________adding a new column with day name______________________//

SELECT 
    date,
    DATENAME(weekday, date) AS Day_of_Week
FROM salesdata;

ALTER TABLE salesdata 
ADD Day_name VARCHAR(20);

update salesdata
		set Day_name=(
					 DATENAME(weekday, date)
					);

select * from salesdata


--\\_________adding a new column with month name____________//



SELECT 
    date,
    DATENAME(month, date) AS Month_Name
FROM 
    salesdata;


alter table salesdata add Month_name varchar(20)

update salesdata
	set Month_name =( DATENAME(month, date)
	);


	select * from salesdata










