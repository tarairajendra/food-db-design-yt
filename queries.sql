-- Q.7: Restaurants with no orders in the past 7 days
select r.name
from restaurants r 
left join orders o on r.id = o.restaurant_id 
where o.created_at < now() - interval 7 day or o.id is null 
group by r.id;


-- Q.8: Most active delivery agent in last 7 days
select concat(a.first_name, ' ', a.last_name) name, count(ass.agent_id) assignments  
from order_assignments ass 
join users a  
on ass.agent_id = a.id  
where ass.created_at >= now() - interval 7 day  -- past 7 days
group by ass.agent_id 
order by assignments desc;

-- Q.1: Average delivery time per restaurant
select r.name, avg(timestampdiff(minute, oas.created_at, oas.drop_at)) avg_delivery_time 
from restaurants r  
join orders o on r.id = o.restaurant_id
join order_assignments oas on o.id = oas.order_id 
where oas.status = 'delivered' 
group by r.id;

-- Q.2: Top-selling menu items this month
select
    mi.name as menu_item,
    sum(oi.quantity) as total_quantity_sold,
    count(o.id) as total_orders
    from orders o
    join order_items oi on o.id = oi.order_id
    join menu_items mi on mi.id = oi.menu_id
    where o.created_at >= date_format(current_date(), '%Y-%m-01')
    group by oi.menu_id, mi.name
    order by total_quantity_sold desc;
