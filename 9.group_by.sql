-- Ejemplo 3: Calcular cuántos clientes hay registrados por cada ciudad.

SELECT 
    ciudad, 
    COUNT(*) AS total_clientes 
FROM 
    clientes 
GROUP BY 
    ciudad 
ORDER BY total_clientes DESC;