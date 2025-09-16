SELECT `CustomerKey`,
       `FirstName`,
       `LastName`,
       'MiddleName is NULL, indicating a missing secondary given name' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer`
WHERE `MiddleName` IS NULL
