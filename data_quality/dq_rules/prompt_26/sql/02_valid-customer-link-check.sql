SELECT f.`SalesOrderNumber`,
       f.`SalesOrderLineNumber`,
       f.`CustomerKey`,
       'CustomerKey does not reference an existing customer in dimcustomer' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` f
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer` d
     WHERE d.`CustomerKey` = f.`CustomerKey`)
