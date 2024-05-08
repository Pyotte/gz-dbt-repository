WITH finance AS(
SELECT
    date_date
    ,COUNT(orders_id) AS nb_transactions
    ,ROUND(SUM(revenue),0) AS revenue 
    ,ROUND(AVG(revenue),1) AS average_basket
    ,ROUND(SUM(revenue)/COUNT(orders_id),1) AS average_basket_bis
    ,ROUND(SUM(margin),0) AS margin 
    ,ROUND(SUM(operational_margin),0) AS operational_margin 
    ,ROUND(SUM(purchase_cost),0) AS purchase_cost 
    ,ROUND(SUM(shipping_fee),0) AS shipping_fee 
    ,ROUND(SUM(logcost),0) AS logcost 
    ,ROUND(SUM(ship_cost),0) AS ship_cost 
    ,SUM(quantity) AS quantity 
FROM {{ref("int_orders_operational")}}
GROUP BY  date_date
ORDER BY  date_date DESC
)
SELECT
    finance.date_date
    ,finance.nb_transactions
    ,finance.revenue
    ,finance.average_basket
    ,finance.average_basket_bis
    ,finance.margin
    ,(finance.operational_margin-campaign.ads_cost) AS operational_margin
    ,finance.purchase_cost
    ,finance.shipping_fee
    ,finance.logcost
    ,finance.ship_cost
    ,finance.quantity
    ,campaign.ads_cost
FROM finance
JOIN {{ ref('int_campaigns_days') }} AS campaign
    ON finance.date_date = campaign.date_date