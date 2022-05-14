-- -----------------------------------------------------------------------------
-- Exercise Database
-- for The Bridge
-- by xavimat
-- 2022-05-14
-- -----------------------------------------------------------------------------

-- Cambiar el nombre de un producto. Para ello, genera una consulta que afecte
--     solo a un determinado producto en función de su id.
UPDATE products SET title = 'De la Tierra a la Luna' WHERE id = 1;

-- Cambiar el precio de un producto a 50€. Para ello, genera una consulta que
--     afecte solo a un determinado producto en función de su id.
UPDATE products SET price = 50 WHERE id = 2;
UPDATE detail SET price = 50 WHERE product_id = 2;
