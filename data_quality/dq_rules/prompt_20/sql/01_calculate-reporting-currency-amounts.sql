SELECT fs.`SalesOrderNumber`,
       fs.`SalesOrderLineNumber`,
       fs.`SalesAmount`,
       cr.`AverageRate`,
       fs.`SalesAmount` * cr.`AverageRate` AS `ReportingCurrencyAmount`,
       'Reporting-currency amount calculation mismatch' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` fs
JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`factcurrencyrate` cr ON fs.`CurrencyKey` = cr.`CurrencyKey`
AND fs.`OrderDateKey` = cr.`DateKey`
WHERE fs.`SalesAmount` * cr.`AverageRate` IS NULL
