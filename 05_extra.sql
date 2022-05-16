-- -----------------------------------------------------------------------------
-- Exercise Database
-- for The Bridge
-- by xavimat
-- 2022-05-14
-- -----------------------------------------------------------------------------

-- 3.1 BORRAR DATOS
-- ⦁ Elimina un producto por su id.
-- Este ejercicio tiene la dificultad de las restricciones que se hayan definido
-- en las FK. En mi BD todas las FK son ON UPDATE CASCADE ON DELETE RESTRICT por
-- lo que no se permitirá borrar un producto que haya sido referenciado en un
-- detalle. Es necesario borrar antes los detalles.

-- Generará error, porque el producto se usa en pedidos:
DELETE FROM products WHERE products.id = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint
-- fails (`boot_shop`.`details`, CONSTRAINT `fk_orders_has_products_products1`
-- FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON
-- UPDATE CASCADE)

-- Hay que borrar primero los detalles:
DELETE FROM details WHERE product_id = 1;
-- Y después el producto:
DELETE FROM products WHERE products.id = 1;


-- 3.2 Actualizar diagrama
-- Crea una nueva tabla reviews y añadela al diagrama especifica también el tipo de relación.
CREATE TABLE IF NOT EXISTS `boot_shop`.`reviews` (
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `stars` TINYINT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`, `product_id`),
  INDEX `fk_reviews_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_reviews_idx1` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_reviews1`
    FOREIGN KEY (`user_id`)
    REFERENCES `boot_shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews2`
    FOREIGN KEY (`product_id`)
    REFERENCES `boot_shop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 3.3. Ejecute las siguientes consultas SQL
-- A continuación, deberá realizar las siguientes consultas SQL:

-- 3.3.1 INSERTAR DATOS
-- Inserte al menos 5 nuevas reviews.
INSERT INTO reviews (user_id, product_id, content, stars)
    VALUES (1, 2, 'Me gustó', 4),
           (2, 3, 'Me PALABROTA gustó PALABROTA mucho PALABROTA', 5),
           (3, 4, 'Me gustó un poco', 3),
           (4, 2, 'No me gustó', 1),
           (5, 2, 'No me gustó del todo', 2);

-- 3.3.2 ACTUALIZAR DATOS
-- Cambia el contenido de una review
UPDATE reviews SET content = 'Me gustó mucho' WHERE user_id = 2 AND product_id = 3;
-- El censor ha revisado las reviews y las hace públicas:
UPDATE reviews SET active = TRUE;

-- 3.3.3 OBTENER DATOS
-- Seleccione todas las reviews.
SELECT * FROM reviews;

-- Seleccione todos los productos con sus respectivas reviews.
SELECT p.id, p.author, p.title, r.content, r.stars
	FROM products p
	LEFT JOIN reviews r ON p.id=r.product_id;

-- Otro ejemplo: mostrar la media de valoraciones (stars)
SELECT p.id, p.author, p.title, AVG(r.stars) AS rating, COUNT(r.product_id) AS num_reviews
	FROM products p
	LEFT JOIN reviews r ON p.id=r.product_id
    GROUP BY p.id;

-- Muestre un producto con sus reviews.
SELECT p.id, p.author, p.title, r.content, r.stars
	FROM products p
	LEFT JOIN reviews r ON p.id=r.product_id
    WHERE p.iD=2;

-- Muestre los productos junto a la categoría a la que pertenece y sus reviews.
SELECT p.id, p.author, p.title, c.name AS category, r.content, r.stars
    FROM products p
    LEFT JOIN reviews r ON p.id=r.product_id
    LEFT JOIN categories c ON p.category_id=c.id;

-- Seleccione un usuario y muestre sus pedidos junto a los productos que contiene cada pedido.
SELECT u.id, u.name, o.id AS order_id, o.date, o.status, d.product_id, p.author,
        p.title, d.quantity, p.price, ROUND((d.quantity * p.price), 2) AS subtotal
    FROM users u
    JOIN orders o ON o.user_id = u.id
    JOIN details d ON d.order_id=o.id
    JOIN products p ON d.product_id=p.id
    WHERE u.id = 3
    ORDER BY o.id;


-- 3.3.4 BORRAR DATOS
-- ⦁ Elimina una review por su id.
-- En mi BD las opiniones (reviews) no tienen id, como PK se usa (user_id,product_id)
DELETE FROM reviews WHERE user_id=1 AND product_id=2;

-- Es fácil añadir una id
ALTER TABLE reviews
	ADD id INT AUTO_INCREMENT UNIQUE;
-- Y usarla para borrar una review:
DELETE FROM reviews WHERE id=3;
