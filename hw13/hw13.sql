create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

create table dogs as
  select "abraham" as name, "long" as fur, 26 as height union
  select "barack"         , "short"      , 52           union
  select "clinton"        , "long"       , 47           union
  select "delano"         , "long"       , 46           union
  select "eisenhower"     , "short"      , 35           union
  select "fillmore"       , "curly"      , 32           union
  select "grover"         , "short"      , 28           union
  select "herbert"        , "curly"      , 31;

create table sizes as
  select "toy" as size, 24 as min, 28 as max union
  select "mini",        28,        35        union
  select "medium",      35,        45        union
  select "standard",    45,        60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
create table size_of_dogs as
<<<<<<< HEAD
  select name, size from dogs, sizes where height > min and height <= max;

-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
  select child from parents, dogs where parent = name order by height desc;

-- Sentences about siblings that are the same size
create table sentences as
  with siblings(one, two) as (
    select a.child, b.child from parents as a, parents as b 
    where a.parent = b.parent
    )
  select one ||' and '|| two ||' are '|| size ||'siblings' from siblings, size_of_dogs
  where one = size and two = size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
  select a.name || ', ' || b.name || ', ' || c.name || ', ' || d.name, a.height + b.height + c.height + d.height from 
  dogs as a, dogs as b, dogs as c, dogs as d where a.height + b.height + c.height + d.height > 170 and a.height > b.height > c.height > d.height;
=======
  select dogs.name, sizes.size from dogs, sizes
  where sizes.max >= dogs.height and dogs.height > sizes.min;

-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
  select p.child from parents as p, dogs as d 
  where p.parent = d.name order by height desc;

-- Sentences about siblings that are the same size
create table sentences as
  select b.child || ' and ' || a.child || ' are ' || c.size || ' siblings'
   from parents as a, parents as b, size_of_dogs as c, size_of_dogs as d
  where a.parent = b.parent
  and c.name = a.child and d.name = b.child and a.child > b.child and c.size = d.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
  with 
  stacked_dogs(names, tothigh, somehigh, n) as (
    select name, height, height, 3 from dogs union
    select names || ", " || name, tothigh + height, height, n - 1
      from stacked_dogs, dogs
      where n > 0 and somehigh < height
    )
select names, tothigh from stacked_dogs 
where n = 0 and tothigh >= 170 order by tothigh;
>>>>>>> ea42b696ecbaea6dcb2bec3a85c37636f3c9fa41

-- non_parents is an optional, but recommended question
-- All non-parent relations ordered by height difference
create table non_parents as
  select "REPLACE THIS LINE WITH YOUR SOLUTION";

create table ints as
    with i(n) as (
        select 1 union
        select n+1 from i limit 100
    )
    select n from i;

create table divisors as
<<<<<<< HEAD
      select a.n * b.n as n, count(*) as divisors
      from ints as a, ints as b
      where a.n * b.n <= 100
      group by a.n*b.n;

create table primes as
    select "REPLACE THIS LINE WITH YOUR SOLUTION";
=======
    with div(n) as (
        select 1 union
        select n+1 from i limit 100
    )
    select a.n as n, count(*) as c from ints as a, ints as b 
    where a.n % b.n = 0 group by a.n;

create table primes as
    select n from divisors where c = 2;
>>>>>>> ea42b696ecbaea6dcb2bec3a85c37636f3c9fa41
