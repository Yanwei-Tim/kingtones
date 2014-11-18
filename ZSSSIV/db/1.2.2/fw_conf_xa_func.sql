create or replace function getJZID(varName in varchar2) return varchar2 is
result varchar2(50);

begin
select id into result from jw_jz where name=varName;

return (result);
end getJZID;


create or replace function getJZName(jzid in varchar2) return varchar2 is
result varchar2(50);

begin
select name into result from jw_jz where id=jzid;

return (result);
end getJZName;
