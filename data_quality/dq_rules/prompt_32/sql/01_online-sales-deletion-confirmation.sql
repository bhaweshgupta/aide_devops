SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       'Record still exists in factinternetsales after deletion process' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`
