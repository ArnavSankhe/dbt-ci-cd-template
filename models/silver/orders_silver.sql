select
  order_id,
  customer_id,
  cast(order_ts as timestamp) as order_ts,
  upper(status) as status,
  amount
from {{ ref('orders_bronze') }}