WITH period_check AS
  (SELECT ProductKey,
          StartDate,
          EndDate,
          ROW_NUMBER() OVER (PARTITION BY ProductKey
                             ORDER BY StartDate) AS rn
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct`)
SELECT a.ProductKey,
       a.StartDate,
       a.EndDate,
       b.StartDate AS next_start_date,
       'Overlapping SCD periods detected' AS violation_reason
FROM period_check a
JOIN period_check b ON a.ProductKey = b.ProductKey
AND a.rn = b.rn - 1
WHERE a.EndDate > b.StartDate
