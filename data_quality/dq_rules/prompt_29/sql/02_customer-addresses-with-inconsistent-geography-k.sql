SELECT c.CustomerKey,
       c.GeographyKey,
       'Customer references an invalid geography key' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer` c
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimgeography` g
     WHERE c.GeographyKey = g.GeographyKey)
