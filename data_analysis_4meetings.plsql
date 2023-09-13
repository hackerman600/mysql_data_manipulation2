--start and do begging routines
sudo service mariadb status
sudo service mariadb start
sudo mysql -u root -p
select user()

--check databases on the system
select * from information_schema.schemata;
use my_little_database;
show tables;

--create the tables
create table employer_information(id int auto_increment primary key, 
                                  gender int, 
                                  age int, 
                                  years_worked_at_company int, 
                                  salary int);


create table employer_information(id int auto_increment primary key, 
                                  gender int, 
                                  age int, 
                                  years_worked_at_company int, 
                                  salary int);

create table skills(id int auto_increment primary key, 
                    programming_language varchar(80), 
                    field varchar(80));     

load data local infile "datasetpath" into table employer_information fields terminated by ',' lines terminated by '\n' ignore 1 lines;
load data local infile "dataset2path" into table employer_information fields terminated by ',' lines terminated by '\n' ignore 1 lines;

--view the id, programming language and salary by inner joining two tables. By doing so,we do not elimiate rows unique to the tables as both id's are the same.
create table skillsandfield_salary as
select employer_information.id, skills.programming_language, skills.fields,employer_information.salary 
from skills 
inner join employer_information 
on skills.id = employer_information.id;   

--trim values in the columns of skills table
update skills set programming_language = trim(both ' ' from programming_language);

--select the avg salaries earned by programmers of different languages along with the program name
select "c++" as "programming language", avg(subq.salary) as "salary for programming language" 
from (select skills.id, skills.programming_language, employer_information.salary 
      from employer_information inner join skills on employer_information.id = skills.id 
      where skills.programming_language = "c++") as subq 
    
union select "python", avg(pysubq.salary) from
     (select skills.id, skills.programming_language,employer_information.salary 
      from skills inner join employer_information 
      on skills.id = employer_information.id 
      where skills.programming_language = 'python') as pysubq;










