/*---------------------------------------------
Workers With The Highest Salaries
find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.
-----------------------------------------------*/

SELECT *
FROM
  (SELECT CASE
              WHEN salary =
                     (SELECT max(salary)
                      FROM worker) THEN worker_title
          END AS best_paid_title
   FROM worker a
   INNER JOIN title b ON b.worker_ref_id=a.worker_id
   ORDER BY best_paid_title) sq
WHERE best_paid_title IS NOT NULL
