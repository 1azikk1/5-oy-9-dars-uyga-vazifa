DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS products CASCADE;


CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY,
	category_name VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS products(
	id SERIAL PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	product_quantity INTEGER CHECK(product_quantity > 0),
	category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL
);


INSERT INTO categories(category_name) VALUES
('Mobile Phones'),
('Laptops'),
('Personal computers'),
('Laptop Accessories'),
('Mobile Accessories');


INSERT INTO products(product_name, product_quantity, category_id) VALUES
('Samsung Galaxy S24 Ultra', 30, 1),
('ASUS ROG STRIX G16', 10, 2),
('ASUS ROG STRIC WITH RTX 4090', 5, 3),
('Graphics Card', 5, NULL),
('Cooler for samsung', 50, NULL),
('Iphone 16 pro max', 100, 1),
('Iphone 15 pro max', 150, 1),
('HP VICTUS', 20, 2),
('Asus Vivobook S 14 Flip', 30, 2),
('DELL ALIENWARE', 5, 3),
('Mac PC', 3, 3),
('Samsung Galaxy S 23 Ultra', 15, 1),
('Airpods Max', 100, NULL),
('Gaming Mouse RGB', 50, NULL),
('Mechanical Keyboard RGB', 200, NULL);


SELECT * FROM categories;
SELECT * FROM products;

-- 1 - UYGA VAZIFA

-- 1 - topshiriq

SELECT * FROM categories
JOIN products ON categories.id = products.category_id;

-- 2 - topshiriq

SELECT * FROM categories LEFT JOIN products ON categories.id = products.category_id;

-- 3 - topshiriq

SELECT * FROM products LEFT JOIN categories ON categories.id = products.category_id;

-- 4 - topshiriq

SELECT * FROM products WHERE category_id IS NULL;

-- 5 - topshiriq

SELECT * FROM categories LEFT JOIN products ON categories.id = products.category_id WHERE category_id IS NULL;

-- 6 - topshiriq

SELECT * FROM categories FULL JOIN products ON products.category_id = categories.id;

-- 7 - topshiriq

SELECT * FROM categories FULL JOIN products ON categories.id = products.category_id WHERE products.category_id IS NULL;

-- 8 - topshiriq

SELECT * FROM categories CROSS JOIN products;

-- 9 - topshiriq

SELECT * FROM categories NATURAL JOIN products;


-- 2 - UYGA VAZIFA


DROP TABLE IF EXISTS courses CASCADE;


CREATE TABLE IF NOT EXISTS courses(
	id SERIAL PRIMARY KEY,
	course_name VARCHAR(100),
	course_id INTEGER REFERENCES courses(id)
);


INSERT INTO courses(course_name, course_id) VALUES
('Programming Languages', NULL),
('Python', 1),
('JavaScript', 1),
('React JS', 3);


SELECT 
    body.course_name AS body_course_name,
    head_courses.course_name AS head_courses
FROM 
    courses AS body
JOIN 
    courses AS head_courses
ON 
    body.course_id = head_courses.id;


-- 3 - UYGA VAZIFA


DROP TABLE IF EXISTS actors CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS actors_by_movies CASCADE;


CREATE TABLE IF NOT EXISTS actors(
	id SERIAL PRIMARY KEY,
	actor_name VARCHAR(100) NOT NULL,
	actor_lastname VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS movies(
	id SERIAL PRIMARY KEY,
	movie_name VARCHAR(150) NOT NULL
);


CREATE TABLE IF NOT EXISTS actors_by_movies(
	actor_id INTEGER REFERENCES actors(id) ON DELETE SET NULL,
	movie_id INTEGER REFERENCES movies(id) ON DELETE SET NULL
);


INSERT INTO actors(actor_name, actor_lastname) VALUES
('Toxir', 'Toxirov'),
('Sobir', 'Sobirov'),
('Bakir', 'Bakirov'),
('Jalil', 'Jalilov');


INSERT INTO movies(movie_name) VALUES
('7 Deadly Sins'),
('Transformers Raise of Beasts'),
('AVENGERS Doomsday');


INSERT INTO actors_by_movies(actor_id, movie_id) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 2),
(4, 3),
(1, 3),
(3, 3),
(2, 2),
(2, 1),
(4, 1);


SELECT actors.actor_name || ' ' || actors.actor_lastname AS actors, movies.movie_name FROM actors
JOIN actors_by_movies ON actors_by_movies.actor_id = actors.id
JOIN movies ON actors_by_movies.movie_id = movies.id ORDER BY actors;


