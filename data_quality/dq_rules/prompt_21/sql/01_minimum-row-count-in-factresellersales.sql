SELECT COUNT(*) AS ROW_COUNT,
       'factresellersales table contains fewer than 10 rows' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factresellersales`
HAVING COUNT(*) < 10
