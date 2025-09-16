SELECT frs.`SalesOrderNumber`,
       frs.`SalesOrderLineNumber`,
       frs.`SalesAmount`,
       'SalesAmount is an outlier based on robust statistical methods' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factresellersales` frs
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimpromotion` dp
     WHERE dp.`PromotionKey` = frs.`PromotionKey`)
  AND ABS(frs.`SalesAmount` -
            (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (
                                                       ORDER BY `SalesAmount`)
             FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factresellersales`)) > 3 *
    (SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (
                                                ORDER BY `SalesAmount`) - PERCENTILE_CONT(0.25) WITHIN GROUP (
                                                                                                              ORDER BY `SalesAmount`)
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factresellersales`)
