-- -----------------------------------------------------------------------------
-- Exercise Database
-- for The Bridge
-- by xavimat
-- 2022-05-13
-- -----------------------------------------------------------------------------

-- Inserte al menos 5 nuevos usuarios.
INSERT INTO users (email, name, NIF) VALUES
    ('rebeca@email.com',  'Rebeca',  '12345678A'),
    ('mike@email.com',    'Mike',    '12345678B'),
    ('sofia@email.com',   'Sofía',   '12345678C'),
    ('gabriel@email.com', 'Gabriel', '12345678D'),
    ('vanesa@email.com',  'Vanesa',  '12345678E'),
    ('german@email.com',  'Germán',  '12345678F'),
    ('vicente@email.com', 'Vicente', '12345678G'),
    ('jorge@email.com',   'Jorge',   '12345678H'),
    ('shan@email.com',    'Shan',    '12345678I');

-- Inserte al menos 2 tipos de categorías.
-- Cambio de orden, porque es necesario insertar las categorías ANTES de los
--  productos.
INSERT INTO categories (name) VALUES
    ('Históricos'),
    ('Policiacos'),
    ('Terror'),
    ('Acción'),
    ('Comedia'),
    ('Drama'),
    ('Romance'),
    ('Ciencia Ficción'),
    ('Suspenso'),
    ('Aventura'),
    ('Fantasía'),
    ('Misterio');

-- Inserte al menos 5 nuevos productos.
INSERT INTO products (author, title, year, price, category_id) VALUES
    ('Julio Verne', 'DE la tierra a la una', 2010, 15.40, 8),
    ('J.K. Rowling', 'Harry Potter y la piedra filosofal', 1997, 19.99, 11),
    ('Carmen Laforet', 'Nada', 1960, 15.15, 6),
    ('Stephen King', 'El cementerio de animales', 1990, 15.00, 3),
    ('Laura Gallego', 'El coleccionista de relojes extraordinarios', 2005, 14.54, 11);


-- Inserte al menos 5 nuevos pedidos(orders).
INSERT INTO orders (user_id, date) VALUES
    (1, '2020-01-01'),
    (2, '2020-01-02'),
    (3, '2020-01-03'),
    (4, '2020-01-04'),
    (5, '2020-01-05'),
    (6, '2020-01-06'),
    (7, '2020-01-07'),
    (8, '2020-01-08'),
    (9, '2020-01-09');

INSERT INTO details (order_id, product_id, quantity, price) VALUES
    (1, 1, 1, 15.40),
    (1, 2, 2, 19.99),
    (1, 3, 1, 15.15),
    (1, 5, 1, 14.54),
    (2, 1, 1, 15.40),
    (2, 2, 1, 19.99),
    (2, 4, 1, 15.00),
    (2, 5, 1, 14.54),
    (3, 1, 1, 15.40),
    (3, 3, 1, 15.15),
    (3, 4, 2, 15.00),
    (3, 5, 1, 14.54),
    (4, 2, 1, 19.99),
    (4, 3, 1, 15.15),
    (4, 4, 3, 15.00),
    (5, 1, 1, 15.40),
    (5, 2, 2, 19.99),
    (5, 3, 1, 15.15),
    (5, 5, 1, 14.54),
    (6, 1, 1, 15.40),
    (6, 2, 1, 19.99),
    (6, 4, 1, 15.00),
    (6, 5, 1, 14.54),
    (7, 1, 2, 15.40),
    (7, 3, 1, 15.15),
    (7, 4, 1, 15.00),
    (7, 5, 1, 14.54),
    (8, 2, 1, 19.99),
    (8, 3, 1, 15.15),
    (8, 4, 1, 15.00),
    (9, 1, 2, 15.40),
    (9, 2, 1, 19.99),
    (9, 3, 1, 15.15),
    (9, 5, 1, 14.54);
