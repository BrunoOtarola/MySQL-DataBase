-- Ejemplo 6:* Evaluar el nivel de stock mediante una función condicional (`IF`).

SELECT 
    nombre, stock, 
        IF(stock &lt;= 10, 'REABASTECER URGENTE', 'STOCK OK') AS estado\_inventario 
FROM productos;