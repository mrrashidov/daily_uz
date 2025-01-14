create extension pgcrypto;


-- varchar(n) = character varying(n) if shorter then declered length simply store shorter string
-- char(n) = character(n) if shorter then declered length space-padded

create table users(
    user_id serial not null unique,
    username varchar(16) unique not null,
    password varchar(72) not null
);

create table images(
    image_id serial not null unique,
    path varchar not null
);

create table expense (
    expense_id serial not null unique,
    expense_name varchar(32) unique not null,
    image_id integer references images(image_id)
);

-- numeric type slow but we can define with items with exact numeric(precision, scale)
create table expense_item (
    expense_item_id serial not null unique,
    expense_id integer references expense(expense_id),
    item_name varchar(64)not null,
    cost numeric(6,3) not null,
    buyed_at timestamptz not null default current_timestamptz 
);