-- Ejemplo 5: Formatear el nombre completo del cliente en mayúsculas y calcular cuántos días llevan registrados en el almacén.

SELECT 
    UPPER(CONCAT(nombre, ' ', apellido)) AS cliente_mayuscula, fecha_registro, 
    DATEDIFF(CURDATE(), fecha_registro) AS dias_registrado 
FROM clientes;