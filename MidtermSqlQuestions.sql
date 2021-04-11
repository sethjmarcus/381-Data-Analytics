CREATE TABLE qcmath290.public.employees(
  emp_id bigint,
  emp_name varchar,
  job_name varchar,
  manager_id varchar,
  hire_date timestamp,
  salary REAL,
  commision REAL,
  dep_id bigint
);

CREATE TABLE qcmath290.public.salary_grade(
  grade bigint,
  min_sal REAL,
  max_sal real
);

CREATE TABLE qcmath290.public.department(
  dep_id bigint,
  dep_name varchar,
  dep_location varchar
);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(66928, 'blaze', 'manager', 68319, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 2750.00, NULL, 3001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES (68319, 'Kayling', 'pres', NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 6000.00, NULL, 1001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(NULL, 'joe1', NULL, NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 2550.00, NULL, 1001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(NULL, 'joe2', NULL, NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 2957.00, NULL, 2001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(NULL, 'joe1', NULL, NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 3100.00, NULL, 2001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(NULL, 'joe3', NULL, NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 3100.00, NULL, 2001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(NULL, 'joe4', NULL, NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 900.00, NULL, 2001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(NULL, 'joe5', NULL, NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 1700.00, NULL, 3001);

INSERT INTO qcmath290.public.employees(emp_id,emp_name, job_name, manager_id, hire_date, salary, commision, dep_id)
VALUES(NULL, 'joe6', NULL, NULL, TO_TIMESTAMP( '1991-03-31' , 'YYYY-MM-DD'), 1350.00, NULL, 3001);



INSERT INTO qcmath290.public.salary_grade(grade, min_sal, max_sal)
values(1, 800, 1300);
INSERT INTO qcmath290.public.salary_grade(grade, min_sal, max_sal)
values(2, 1301, 1500);
INSERT INTO qcmath290.public.salary_grade(grade, min_sal, max_sal)
values(3, 1501, 2100);
INSERT INTO qcmath290.public.salary_grade(grade, min_sal, max_sal)
values(4, 2101, 3100);

TRUNCATE qcmath290.public.department;

INSERT INTO qcmath290.public.department(dep_id, dep_name, dep_location)
VALUES(1001, 'Finance', 'Sydney');
INSERT INTO qcmath290.public.department(dep_id, dep_name, dep_location)
VALUES(2001, 'Audit', 'Melbourne');
INSERT INTO qcmath290.public.department(dep_id, dep_name, dep_location)
VALUES(3001, 'Marketing', 'Perth');
INSERT INTO qcmath290.public.department(dep_id, dep_name, dep_location)
VALUES(4001, 'Production', 'Brisbane');



Select E.emp_name
From employees as E join department as D
  On E.dep_id = D.dep_id
Where Extract(YEAR FROM E.hire_date) < 2020 AND upper(D.dep_name) = upper('Finance');

Select e.emp_name , e.salary , d.dep_name , d.dep_location, sg.grade 
From employees AS E join department as D
  ON E.dep_id = D.dep_id and upper(d.dep_location) = upper('Sydney')
  Join salary_grade as sg
  On E.salary >= sg.min_sal and E.salary <= sg.max_sal
Where sg.grade >= 3;
