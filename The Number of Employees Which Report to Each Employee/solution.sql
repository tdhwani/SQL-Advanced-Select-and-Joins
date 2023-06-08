select 
  q1.employee_id, 
  q1.name, 
  q2.reports_count, 
  round(q2.average_age, 0) as average_age 
from 
  (
    select 
      * 
    from 
      Employees 
    where 
      employee_id in(
        select 
          distinct reports_to 
        from 
          Employees
      )
  ) as q1 
  left join (
    select 
      reports_to, 
      count(employee_id) as reports_count, 
      avg(age) as average_age 
    from 
      Employees 
    group by 
      reports_to
  ) as q2 on q1.employee_id = q2.reports_to 
order by 
  q1.employee_id;
