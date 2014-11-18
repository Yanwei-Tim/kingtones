 统计指定模块 用户的使用次数
 select * from (
     select user_id,
            biz_id,
            sysdate - TO_DATE(to_char(max(op_time),'YYYY-MM-DD'),'YYYY-MM-DD') mmmmmmmmmmm,
            systimestamp - max(op_time),
            substr(systimestamp - max(op_time),0,10 ),
            to_number(substr(systimestamp - max(op_time),0,10 )) mx
       from jw_log
       where biz_id in ('B201100000','B201100001')
      group by user_id, biz_id
      ) ll ,business_config b,jw_user u
      where ll.biz_id = b.b_id and ll.user_id = u.account and mx>=10
      
 统计指定模块 指定天使 未使用的用户（前提，初始每个用户都记录过一条日志）  
  select *
  from (select count(1) num, l.user_id, l.biz_id
          from jw_log l
         where l.biz_id in ('B201100000', 'B201100001')
         group by l.user_id, l.biz_id
         order by l.biz_id, l.user_id) ll,
         business_config b,
         jw_user u
 where ll.biz_id = b.b_id
 and ll.user_id = u.account