select
  order_id,
  customer_id,
  order_ts,
  status,
  amount
from {{ ref('raw_orders') }}