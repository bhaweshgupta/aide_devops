SELECT f.`SalesOrderNumber`,
       f.`SalesOrderLineNumber`,
       f.`PromotionKey`,
       p.`StartDate`,
       p.`EndDate`,
       'Promotion applied outside its valid date range' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` f
JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimpromotion` p ON f.`PromotionKey` = p.`PromotionKey`
WHERE f.`OrderDate` NOT BETWEEN p.`StartDate` AND p.`EndDate`
