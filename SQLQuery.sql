select *
from dbo.googleplaystore

--Checking type of category

select distinct Category  /* You would observe that there is a category name 1.9, which can't be a category*/
from dbo.googleplaystore 

Delete from dbo.googleplaystore
where Category='1.9'

--Cheking type of app

select distinct Type
from dbo.googleplaystore

delete from dbo.googleplaystore
where Type='NaN'

--Which age category has rated the app

select distinct [Content Rating]
from dbo.googleplaystore

--Total no. of reviews in each category of apps

select distinct Category,count(Reviews) as no_of_reviews
from dbo.googleplaystore
group by Category
order by Category

--Free App vs Paid App

select distinct Type, COUNT(App) as no_of_apps
from dbo.googleplaystore
group by Type
order by Type

--Total no. of category

select distinct Category,COUNT(*) as No_of_Category
from dbo.googleplaystore
group by Category

-- Total no. of installs in each category

with t1 as
(
select distinct Category,replace(Installs,'+','') as no_of_install
from dbo.googleplaystore
)

select distinct Category, SUM(cast(no_of_install as bigint))
from t1
group by category 

--Max size of app according to category
select distinct Category,MAX(Size)
from dbo.googleplaystore
where size not like '%Varies with device%'
group by Category

