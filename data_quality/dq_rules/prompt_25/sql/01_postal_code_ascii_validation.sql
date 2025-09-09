SELECT `GeographyKey`,
       `PostalCode`,
       'PostalCode contains non-ASCII characters or mixed scripts' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimgeography`
WHERE `PostalCode` != trim(`PostalCode`)
  OR NOT encode(trim(`PostalCode`), 'ascii') = trim(`PostalCode`)
