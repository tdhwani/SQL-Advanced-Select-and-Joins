select 
  if(
    exists(
      select 
        t1.person_name 
      from 
        (
          select 
            *, 
            sum(weight) over(
              order by 
                turn asc
            ) as tot 
          from 
            Queue 
          order by 
            turn asc
        ) as t1 
        join (
          select 
            *, 
            sum(weight) over(
              order by 
                turn asc
            ) as tot 
          from 
            Queue 
          order by 
            turn asc
        ) as t2 on t1.turn = t2.turn - 1 
      where 
        t1.tot <= 1000 
        and t2.tot > 1000
    ), 
    (
      select 
        t1.person_name 
      from 
        (
          select 
            *, 
            sum(weight) over(
              order by 
                turn asc
            ) as tot 
          from 
            Queue 
          order by 
            turn asc
        ) as t1 
        join (
          select 
            *, 
            sum(weight) over(
              order by 
                turn asc
            ) as tot 
          from 
            Queue 
          order by 
            turn asc
        ) as t2 on t1.turn = t2.turn - 1 
      where 
        t1.tot <= 1000 
        and t2.tot > 1000
    ), 
    (
      select 
        person_name 
      from 
        Queue 
      where 
        turn = (
          select 
            max(turn) 
          from 
            Queue
        )
    )
  ) as person_name;
