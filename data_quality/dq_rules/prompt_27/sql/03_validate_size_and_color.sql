SELECT ProductKey,
       SIZE,
       Color,
       'Invalid Size or Color value' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct`
WHERE SIZE NOT IN ('Small',
                   'Medium',
                   'Large')
  OR Color NOT IN ('Red',
                   'Blue',
                   'Green',
                   'Black',
                   'White')
