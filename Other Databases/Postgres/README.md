# Installation

https://hub.docker.com/_/postgres

docker pull postgres

docker run --name pg1 -e POSTGRES_PASSWORD=kushal10 -d postgres

docker exec -it pg1 psql -U postgres

# Few Commands

```
create table temp(t int);

insert into temp(t) select random()*100 from generate_series(0, 100000);

select * from temp limit 10;
```

## Create Table

```
create table employees( id serial primary key, name text);
```

## Create Function
```
create or replace function random_string(length integer) returns text as 
$$
declare
  chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
  result text := '';
  i integer := 0;
  length2 integer := (select trunc(random() * length + 1));
begin
  if length2 < 0 then
    raise exception 'Given length cannot be less than 0';
  end if;
  for i in 1..length2 loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  end loop;
  return result;
end;
$$ language plpgsql;
```

## Insertion

```
insert into employees(name)(select random_string(10) from generate_series(0, 1000000));
```

## Commands

\d command is used to display information about database objects such as tables, views, indexes, sequences, and functions. It allows you to retrieve the structure and properties of these objects within the current database.


```
\d employees


explain analyze select id from employees where id=2000;

create index employees_name on employees(name);

```