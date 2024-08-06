/*----------------------------------------------------------------------
(Amazon->Hard)
Customer Tracking
Given the users' sessions logs on a particular day, calculate how many hours each user was active that day.
Note: The session starts when state=1 and ends when state=0.
-----------------------------------------------------------------------*/

with time_deltas as (
SELECT cust_id, state,
lead(state) over(partition by cust_id order by timestamp ) as next_state,
((lead(timestamp) over(partition by cust_id order by timestamp))::TIME  -  timestamp::TIME )/(3600) as time_delta_hours
FROM cust_tracking
),

-- else null , not 0 (that is time so cannot put 0)
active_hours as (
SELECT cust_id,
case when state = 1 and next_state = 0 then time_delta_hours else null end as activehours
FROM time_deltas
)

select cust_id,SUM(activehours) as activehours
from active_hours 
group by cust_id











