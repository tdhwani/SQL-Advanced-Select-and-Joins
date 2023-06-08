select 
  t1.employee_id, 
  department_id 
from 
  Employee as t1 
  join (
    select 
      employee_id, 
      count(department_id) as tot_dept 
    from 
      Employee 
    group by 
      employee_id
  ) as t2 on t1.employee_id = t2.employee_id 
where 
  primary_flag = 'Y' 
  or tot_dept = 1;
