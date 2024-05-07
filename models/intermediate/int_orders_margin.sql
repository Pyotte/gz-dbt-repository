SELECT
    orders_id
    ,date_date
    ,ROUND(SUM(revenue),2) AS revenue
    ,ROUND(SUM(purchase_price),2) purchase_cost
    ,ROUND(SUM(margin),2) AS margin
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date
ORDER BY orders_id DESC