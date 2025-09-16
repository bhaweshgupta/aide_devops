SELECT c.CustomerKey,
       c.AddressLine1,
       c.AddressLine2,
       'Customer address has missing address lines' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer` c
WHERE c.AddressLine1 IS NULL
  OR c.AddressLine1 = ''
  OR c.AddressLine2 IS NULL
  OR c.AddressLine2 = ''
