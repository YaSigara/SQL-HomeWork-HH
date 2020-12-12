CREATE SCHEMA job_finder;
set search_path=job_finder;

CREATE TABLE area(
    area_id serial primary key,
    area_name text not null
);

CREATE TABLE post(
    post_id serial primary key,
    post_name text not null
);

CREATE TABLE employee(
    employee_id serial primary key,
    first_name varchar(20) not null,
    second_name varchar(20) not null,
    middle_name varchar(20) not null,
    email text,
    area_id int not null references area(area_id)
);

CREATE TABLE employer(
    employer_id serial primary key,
    org_name text not null,
    email text,
    phone_nubmer varchar(10)
);

CREATE TABLE vacancy(
    vacancy_id serial primary key,
    post_id int not null references post(post_id),
    employer_id int not null references employer(employer_id),
    aria_id int not null references area(area_id),
    compensation_from int,
    compensation_to int,
    compensation_gross bool not null,
    created_at timestamp default now()
);

CREATE TABLE response(
    response_id serial primary key,
    vacancy_id int not null references vacancy(vacancy_id),
    employee_id int not null references employee(employee_id),
    created_at timestamp not null default now()
);
