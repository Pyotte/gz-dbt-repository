SELECT
    DATE_TRUNC(date_date, month) AS month
    ,SUM(nb_transactions) AS nb_transactions
    ,SUM(revenue) AS revenue
    ,SUM(average_basket) AS average_basket
    ,SUM(average_basket_bis) AS average_basket_bis
    ,SUM(margin) AS margin
    ,SUM(operational_margin) AS operational_margin
    ,SUM(purchase_cost) AS purchase_cost
    ,SUM(shipping_fee) AS shipping_fee
    ,SUM(logcost) AS logcost
    ,SUM(ship_cost) AS ship_cost
    ,SUM(quantity) AS quantity
    ,SUM(ads_cost) AS ads_cost
FROM {{ ref('finance_campaigns_days') }}
GROUP BY month