WITH cost AS(
SELECT
    sales.date_date
    ,sales.orders_id
    ,sales.pdt_id
    ,sales.revenue
    ,sales.quantity
    ,product.purchase_price
    ,ROUND((sales.quantity*product.purchase_price),2) AS purchase_cost
FROM {{ ref('stg_raw__sales') }} AS sales
JOIN {{ ref('stg_raw__product') }} AS product
    ON sales.pdt_id = product.products_id

)

SELECT
    date_date
    ,orders_id
    ,pdt_id
    ,revenue
    ,purchase_cost
    ,ROUND((revenue-purchase_cost),2) AS margin
FROM cost