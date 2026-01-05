select
  customer_id,
  count(*) as total_orders,
  sum(amount) as total_amount,
  min(order_ts) as first_order_ts,
  max(order_ts) as last_order_ts
from {{ ref('orders_silver') }}
group by customer_id