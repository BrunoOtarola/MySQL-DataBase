-- Ejemplo 4: Buscar clientes cuyo apellido comience con 'M' o contenga 'ez'.

SELECT 
	nombre, apellido, email 
FROM 
	clientes 
WHERE 
	apellido LIKE 'M%' OR apellido LIKE '%ez%';