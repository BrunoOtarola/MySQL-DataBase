-- Ejemplo 2: Detalle de los productos comprados en la Boleta N° 1.

SELECT 
    dv.venta_id AS nro_boleta, 
    p.nombre AS producto, 
    p.categoria, dv.cantidad, dv.precio_unitario, 
    (dv.cantidad * dv.precio_unitario) AS subtotal 
FROM detalle_ventas dv 
INNER JOIN productos p 
ON 
    dv.producto_id = p.id 
WHERE 
    dv.venta_id = 1;