SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       SUM(CASE
               WHEN `SalesAmount` >= 0 THEN `SalesAmount`
               ELSE 0
           END) - SUM(CASE
                          WHEN `SalesAmount` < 0 THEN ABS(`SalesAmount`)
                          ELSE 0
                      END) AS `NetRevenue`,
       'Net revenue calculated by subtracting returns from sales' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factresellersales`
GROUP BY `SalesOrderNumber`,
         `SalesOrderLineNumber`
