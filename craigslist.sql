DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULl UNIQUE
);


CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    encrypted_password TEXT,
    preferred_region_id INTEGER NOT NULL,
    FOREIGN KEY (preferred_region_id) REFERENCES regions (id)
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    location TEXT NOT NULL,
    user_id INTEGER NOT NULL UNIQUE,
    region_id INTEGER NOT NULL UNIQUE,
    category_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (region_id) REFERENCES regions (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);