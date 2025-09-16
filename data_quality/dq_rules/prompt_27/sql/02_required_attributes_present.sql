SELECT ProductKey,
       EnglishProductName,
       Color,
       'Required attributes are missing' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct`
WHERE EnglishProductName IS NULL
  OR Color IS NULL
