-- -----------------------------------------------------------------------------
-- Exercise Database
-- for The Bridge
-- by xavimat
-- 2022-05-14
-- -----------------------------------------------------------------------------

-- GET DATA

-- Seleccione todos los productos con un precio superior a 20€.
SELECT * FROM products WHERE price > 20;

-- Muestre de forma descendente los productos.
SELECT * FROM products ORDER BY price DESC;

-- Seleccione todos los productos y que muestre la categoría a la que pertenecen.
SELECT p.id, p.author, p.title, p.price, c.name AS category
    FROM products p
    JOIN categories c
    ON p.category_id = c.id;

-- Seleccione todos los usuarios y muestre sus pedidos.
-- Versión con el total, sin el detalle del pedido
SELECT u.id, u.name, o.id AS order_id, o.date, o.status, SUM(d.quantity) AS num_items, ROUND(SUM(d.price*d.quantity), 2) AS total
    FROM users u
    LEFT JOIN orders o ON o.user_id = u.id
    LEFT JOIN details d ON d.order_id=o.id
    GROUP BY u.id;
-- Versión con el detalle del pedido
SELECT u.id, u.name, o.id AS order_id, o.date, o.status, d.product_id, p.author, p.title, d.quantity, p.price, ROUND((d.quantity * p.price), 2) AS subtotal
    FROM users u
    LEFT JOIN orders o ON o.user_id = u.id
    LEFT JOIN details d ON d.order_id=o.id
    LEFT JOIN products p ON d.product_id=p.id
    ORDER BY u.id, o.id;

-- Selecciona un producto por su id y que muestre la categoría a la que pertenece.
SELECT p.author, p.title, c.name AS category
	FROM products p
    JOIN categories c ON p.category_id=c.id
    WHERE p.id = 3;

-- Seleccione a un usuario por su id y muestre los pedidos que tiene.
-- Versión con el total, sin el detalle del pedido
SELECT u.id, u.name, o.id AS order_id, o.date, o.status, SUM(d.quantity) AS num_items, ROUND(SUM(d.price*d.quantity), 2) AS total
    FROM users u
    JOIN orders o ON o.user_id = u.id
    JOIN details d ON d.order_id=o.id
    WHERE u.id=3;
-- Versión con el detalle del pedido
SELECT u.id, u.name, o.id AS order_id, o.date, o.status, d.product_id, p.author, p.title, d.quantity, p.price, ROUND((d.quantity * p.price), 2) AS subtotal
    FROM users u
    JOIN orders o ON o.user_id = u.id
    JOIN details d ON d.order_id=o.id
    JOIN products p ON d.product_id=p.id
    WHERE u.id = 3
    ORDER BY o.id;
