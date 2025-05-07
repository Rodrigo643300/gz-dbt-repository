 SELECT
     date_date
     ,COUNT(orders_id) AS nb_transactions -- Calculo Número total de transacciones --
     ,ROUND(SUM(revenue),0) AS revenue -- Calculo Ingresos totales --
     ,ROUND(AVG(AVG(revenue),1)) AS average_basket -- Calculo Cesta promedio (panier moyen) -- 
     ,ROUND(SUM(margin),0) AS margin -- Margen (Margen BRUTO) -- 
     ,ROUND(SUM(operational_margin),0) AS operational_margin -- Margen operativo (Marge NET) --
     ,ROUND(SUM(purchase_cost),0) AS purchase_cost -- Costo total de la compra --
     ,ROUND(SUM(shipping_fee),0) AS shipping_fee -- Gastos de envío totales --
     ,ROUND(SUM(logcost),0) AS logcost -- Costos totales de logistica (registro) --
     ,ROUND(SUM(ship_cost),0) AS ship_cost 
     ,SUM(quantity) AS quantity -- Cantidad total de productos vendidos --
 FROM {{ref("int_orders_operational")}}
 GROUP BY  date_date
 ORDER BY  date_date DESC