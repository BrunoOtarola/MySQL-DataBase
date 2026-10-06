-- Ejemplo 4: Total vendido por cada método de pago, considerando solo los métodos con ventas acumuladas superiores a $10.000 (`HAVING`).

SELECT 
    metodo_pago, 
    COUNT(*) AS cantidad_ventas, 
    SUM(total) AS total_recaudado, 
    ROUND(AVG(total), 2) AS promedio_venta 
FROM 
    ventas 
GROUP BY 
    metodo_pago 
HAVING total_recaudado > 10000;