-- Ejemplo 1: Ver las boletas (ventas) emitidas, mostrando el nombre del cliente y el vendedor que lo atendió.

SELECT 
    ven.id AS nro_boleta, ven.fecha_hora, 
    CONCAT(cli.nombre, ' ', cli.apellido) AS cliente, 
    CONCAT(vend.nombre, ' ', vend.apellido) AS vendedor, ven.metodo_pago, ven.total 
FROM 
    ventas ven 
INNER JOIN 
    clientes cli ON ven.cliente_id = cli.id 
INNER JOIN 
    vendedores vend ON ven.vendedor_id = vend.id 
ORDER BY ven.fecha_hora ASC;