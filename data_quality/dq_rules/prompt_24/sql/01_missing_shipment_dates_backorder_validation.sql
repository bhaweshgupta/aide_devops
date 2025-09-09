SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       `ShipDate`,
       'Missing ShipDate for non-backorder or backorder without promised date' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`
WHERE `ShipDate` IS NULL
