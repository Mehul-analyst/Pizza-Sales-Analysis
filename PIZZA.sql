use pizza ;

select * from pizza ;
-- Total Revenue
select sum(total_price)  Total_Revenue from pizza ;

-- Average Order Value
select sum(total_price)  / count(distinct(order_id)) as Average_order_value from pizza ;


-- total pizza sold
select sum(quantity) as total_number_of_pizza_sold from pizza ;


-- average pizza per order
select round(avg(count),0) as avg_pizza_order from (select  count(order_id)  as count from pizza group by  order_id) as t  ;

-- Daily Trend
select dayname( order_date )  as dayname , count(distinct(order_id)) as count_of_day from pizza group by dayname ;

-- hourly trend
select hour(order_time) as hour  ,count(distinct (order_id)) as hourly_count from pizza group by hour   ;

--

select * from pizza ;

-- category - revenue distribution
select pizza_category ,  sum(total_price) as Total_Sales  ,( sum(total_price) *100/ sum(sum(total_price)) over() )as
    PCT from pizza group by pizza_category ;


-- pizza_size - revenue distribution

select pizza_size ,  sum(total_price) as Total_Sales  ,round(( sum(total_price) *100/ sum(sum(total_price))
    over() ),2)as PCT from pizza group by pizza_size ;



-- total pizza sold by pizza category
select pizza_category ,  sum(quantity) as Total_Count   from pizza group by pizza_category ;


-- top 5 best sellers by total pizzas sold

select pizza_name , sum(quantity)  as total_pizza from pizza group by pizza_name order by sum(quantity) desc limit 5  ;



-- top 5 worst sellers by total pizzas sold

select pizza_name , sum(quantity)  as total_pizza from pizza group by pizza_name order by sum(quantity)  limit 5  ;



