SELECT s.ProductSubcategoryKey,
       s.ProductCategoryKey,
       'Subcategory not linked to a valid category' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproductsubcategory` s
LEFT JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimproductcategory` c ON s.ProductCategoryKey = c.ProductCategoryKey
WHERE c.ProductCategoryKey IS NULL
