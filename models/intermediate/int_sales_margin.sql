WITH purchase AS(
SELECT
    sales.date_date
    ,sales.orders_id
    ,sales.products_id
    ,sales.revenue
    ,sales.quantity
    ,product.purchase_price
    ,ROUND((sales.quantity*product.purchase_price),2) AS purchase_cost
FROM {{ ref('stg_raw__sales') }} AS sales
JOIN {{ ref('stg_raw__product') }} AS product
 ON sales.products_id = product.products_id
)
 SELECT
    date_date
    ,orders_id
    ,products_id
    ,revenue
    ,quantity
    ,purchase_price
    ,ROUND((revenue-purchase_cost),2) AS margin
FROM purchase