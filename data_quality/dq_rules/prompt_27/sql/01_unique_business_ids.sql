SELECT ProductKey,
       COUNT(*) AS duplicate_count,
       'Duplicate ProductKey found' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct`
GROUP BY ProductKey
HAVING COUNT(*) > 1
