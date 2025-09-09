SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       'Duplicate line detected in factinternetsales' AS violation_reason
FROM
  (SELECT `SalesOrderNumber`,
          `SalesOrderLineNumber`,
          ROW_NUMBER() OVER (PARTITION BY `SalesOrderNumber`, `SalesOrderLineNumber`
                             ORDER BY `SalesOrderNumber`) AS row_num
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`) subquery
WHERE row_num > 1
