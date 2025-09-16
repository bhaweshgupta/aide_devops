SELECT c.CustomerKey,
       c.AddressLine1,
       c.AddressLine2,
       g.PostalCode,
       'Customer address has missing or invalid postal code' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer` c
LEFT JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimgeography` g ON c.GeographyKey = g.GeographyKey
WHERE g.PostalCode IS NULL
  OR g.PostalCode = ''
