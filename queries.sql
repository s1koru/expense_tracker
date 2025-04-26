SELECT
  DATE_FORMAT(spent_at, '%Y-%m') AS month,
  SUM(amount) AS total_spent
FROM expenses
GROUP BY month;

SELECT
  c.name        AS category,
  SUM(e.amount) AS sum_by_cat
FROM expenses e
JOIN categories c ON e.category_id = c.category_id
WHERE e.spent_at BETWEEN '2025-04-01' AND '2025-04-30'
GROUP BY c.name
ORDER BY sum_by_cat DESC;

SELECT
  e.expense_id, c.name, e.amount, e.spent_at, e.note
FROM expenses e
JOIN categories c USING (category_id)
ORDER BY e.amount DESC
LIMIT 1;
