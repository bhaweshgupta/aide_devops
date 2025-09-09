SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       `SalesAmount`,
       `TaxAmt`,
       `Freight`,
       'Negative monetary amount detected' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`
WHERE `SalesAmount` < 0
  OR `TaxAmt` < 0
  OR `Freight` < 0
