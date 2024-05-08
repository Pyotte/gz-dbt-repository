SELECT
    margin.orders_id
    ,margin.date_date
    ,margin.revenue
    ,margin.margin
    ,margin.purchase_cost
    ,margin.quantity
    ,shipping.shipping_fee
    ,shipping.logcost
    ,shipping.ship_cost
    ,ROUND((margin.margin+shipping.shipping_fee-shipping.logcost-shipping.ship_cost),2) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS margin
JOIN {{ ref('stg_raw__ship') }} AS shipping
ON margin.orders_id = shipping.orders_id
ORDER BY orders_id DESC