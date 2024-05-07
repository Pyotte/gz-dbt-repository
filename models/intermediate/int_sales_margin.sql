SELECT
    sales.revenue
    ,product.purchase_price
    ,(sales.revenue-product.purchase_price) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales
JOIN {{ ref('stg_raw__product') }} AS product
    ON sales.pdt_id = product.products_id