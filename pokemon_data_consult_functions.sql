-- CREACIÓN DE VISTAS --

CREATE VIEW vista_pokemon_tipos AS
SELECT p.numero_pokedex, p.nombre, t.nombre AS tipo
FROM pokemon p
JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
JOIN tipo t ON pt.id_tipo = t.id_tipo;

SELECT * 
FROM vista_pokemon_tipos;

CREATE VIEW vista_movimientos_efectos AS
SELECT m.nombre, m.potencia, es.efecto_secundario
FROM movimiento m
JOIN movimiento_efecto_secundario mes ON m.id_movimiento = mes.id_movimiento
JOIN efecto_secundario es ON mes.id_efecto_secundario = es.id_efecto_secundario;

SELECT * 
FROM vista_movimientos_efectos;

CREATE VIEW vista_evoluciones_pokemon AS
SELECT p.numero_pokedex, p.nombre, te.tipo_evolucion, ne.nivel
FROM pokemon p
JOIN pokemon_forma_evolucion pfe ON p.numero_pokedex = pfe.numero_pokedex
JOIN forma_evolucion fe ON pfe.id_forma_evolucion = fe.id_forma_evolucion
JOIN tipo_evolucion te ON fe.tipo_evolucion = te.id_tipo_evolucion
JOIN nivel_evolucion ne ON fe.id_forma_evolucion = ne.id_forma_evolucion;

SELECT * 
FROM vista_evoluciones_pokemon;	

-- CREACIÓN DE FUNCIONES --

DELIMITER //

CREATE FUNCTION peso_promedio_pokemon()
RETURNS DOUBLE DETERMINISTIC
BEGIN
    RETURN (SELECT AVG(peso) FROM pokemon);
END //

DELIMITER ;

SELECT peso_promedio_pokemon()

DELIMITER //

CREATE FUNCTION nombre_pokemon(numero INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    RETURN (SELECT nombre FROM pokemon WHERE numero_pokedex = numero);
END //

DELIMITER ;

SELECT nombre_pokemon(25);

DELIMITER //

CREATE FUNCTION potencia_movimiento(id_mov INT)
RETURNS INT DETERMINISTIC
BEGIN
    RETURN (SELECT potencia FROM movimiento WHERE id_movimiento = id_mov LIMIT 1);
END //

DELIMITER ;

SELECT potencia_movimiento(5);

DELIMITER //

CREATE FUNCTION tipo_ataque_movimiento(id_mov INT)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    RETURN (SELECT t.nombre FROM movimiento m
            JOIN tipo t ON m.id_tipo = t.id_tipo
            WHERE m.id_movimiento = id_mov LIMIT 1);
END //

DELIMITER ;

SELECT tipo_ataque_movimiento(5);

DELIMITER //
CREATE FUNCTION evolucion_pokemon(numero INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    RETURN (SELECT te.tipo_evolucion FROM pokemon p
			JOIN pokemon_forma_evolucion pfe ON p.numero_pokedex = pfe.numero_pokedex
			JOIN forma_evolucion fe ON pfe.id_forma_evolucion = fe.id_forma_evolucion
			JOIN tipo_evolucion te ON fe.tipo_evolucion = te.id_tipo_evolucion
			JOIN nivel_evolucion ne ON fe.id_forma_evolucion = ne.id_forma_evolucion
            WHERE p.numero_pokedex = numero LIMIT 1);
END //
DELIMITER ;

SELECT evolucion_pokemon (1)

-- Store Procedures --

DELIMITER //
CREATE PROCEDURE insertar_pokemon(
    IN numero INT, 
    IN nombre VARCHAR(100), 
    IN peso DOUBLE, 
    IN altura DOUBLE
)
BEGIN
    INSERT INTO pokemon (numero_pokedex, nombre, peso, altura)
    VALUES (numero, nombre, peso, altura);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_potencia_movimiento(
    IN id_mov INT, 
    IN nueva_potencia INT
)
BEGIN
    UPDATE movimiento 
    SET potencia = nueva_potencia 
    WHERE id_movimiento = id_mov;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE eliminar_pokemon(IN numero INT)
BEGIN
    DELETE FROM pokemon WHERE numero_pokedex = numero;
END //
DELIMITER ;

-- Triggers --

DELIMITER //
CREATE TRIGGER validar_pokemon_insert
BEFORE INSERT ON pokemon
FOR EACH ROW
BEGIN
    IF NEW.peso <= 0 OR NEW.altura <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El peso y la altura del Pokémon deben ser mayores a 0.';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER validar_evolucion_pokemon
BEFORE INSERT ON pokemon_forma_evolucion
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pokemon WHERE numero_pokedex = NEW.numero_pokedex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No se puede registrar una evolución para un Pokémon que no existe.';
    END IF;
END //
DELIMITER ;


INSERT INTO pokemon (numero_pokedex, nombre, peso, altura)
VALUES (153, 'Bayleef', 0, 0);

INSERT INTO pokemon_forma_evolucion (numero_pokedex, id_forma_evolucion)
VALUES (200, 1);
