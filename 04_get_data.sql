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
SELECT p.id, p.title, p.price, c.name
    FROM products p
    JOIN categories c
    ON p.category_id = c.id;

-- Seleccione todos los usuarios y muestre sus pedidos.
SELECT u.id,
    FROM 


-- Selecciona un producto por su id y que muestre la categoría a la que pertenece.
-- Seleccione a un usuario por su id y muestre los pedidos que tiene.
