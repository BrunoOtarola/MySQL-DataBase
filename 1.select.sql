-- Ejemplo 1: Obtener el listado de todos los productos ordenados por precio de mayor a menor.

SELECT 
	nombre, categoria, precio_unitario, stock 
FROM 
	productos 
ORDER BY 
	precio_unitario DESC;