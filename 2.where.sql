-- Ejemplo 2: Buscar clientes de 'Santiago' o 'Providencia' que no tengan número de teléfono registrado (`IS NULL`).

SELECT 
	nombre, apellido, ciudad, email, telefono 
FROM 
	clientes 
WHERE 
	ciudad IN ('Santiago', 'Providencia') AND telefono IS NULL;


-- Ejemplo 3: Productos con stock crítico (menor a 10 unidades) o de la categoría 'Abarrotes'.
SELECT 
	nombre, categoria, stock, precio_unitario 
FROM 
	productos 
WHERE 
	stock < 10 OR categoria = 'Abarrotes';