SELECT ProductKey,
       EndDate,
       'Item is active but has an EndDate' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct`
WHERE EndDate IS NOT NULL
  AND EndDate <= current_date()
