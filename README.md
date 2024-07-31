    --CONSULTAS BASICAS

1. Consultar todos los productos y sus categorías --->
```
SELECT p.id_producto, p.nombre AS producto, c.descripcion AS categoria 
FROM productos p 
JOIN categorias c ON p.id_categoria = c.id_categoria;
```

2. Consultar todas las compras y los clientes que las realizaron --->
```
SELECT co.id_compra, cl.nombre, cl.apellidos 
FROM compras co 
JOIN clientes cl ON co.id_cliente = cl.id_clientes;
```

3. Consultar los productos comprados en una compra específica --->
```
SELECT cp.id_producto, p.nombre, cp.cantidad, cp.total 
FROM compras_productos cp 
JOIN productos p ON cp.id_producto = p.id_producto 
WHERE cp.id_compra = 1;
```

4. Agregar un nuevo producto ---->
```
INSERT INTO productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) 
VALUES (4, 'Pantalon', 2, '3456789012345', 999.99, 10, 3);
```

5. Actualizar el stock de un producto --->
```
UPDATE productos 
SET cantidad_stock = 15 
WHERE id_producto = 4;
```

6. Consultar todas las compras de un cliente específico --->
```
SELECT *
FROM compras co 
WHERE co.id_cliente = 'C002';
```

7. Consultar todos los clientes y sus correos electrónicos --->
```
SELECT id_clientes, nombre, correo_electronico 
FROM clientes;
```

8 Consultar la cantidad total de productos comprados en cada compra --->
```
SELECT cp.id_compra, SUM(cp.cantidad) AS "total productos"
FROM compras_productos cp 
GROUP BY cp.id_compra;
```

9. Consultar las compras realizadas en un rango de fechas --->
```
SELECT *
FROM compras 
WHERE fecha BETWEEN '2024-07-01 14:30:00' AND '2024-07-03 16:45:00';
```


    --CONSULTAS USANDO FUNCIONES AGREGADAS

10. Contar la cantidad de productos por categoría
```
SELECT COUNT(*) AS "total productos", c.descripcion AS categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.descripcion;
```

11. Calcular el precio total de ventas por cada cliente
```
SELECT c.nombre, c.apellidos, SUM(cp.total) AS "total ventas" 
FROM compras_productos cp 
JOIN compras co ON cp.id_compra = co.id_compra 
JOIN clientes c ON co.id_cliente = c.id_clientes 
GROUP BY c.id_clientes;
```

12. Calcular el precio promedio de los productos por categoría
```
SELECT c.descripcion AS categoria, AVG(p.precio_venta) AS "precio promedio" 
FROM productos p 
JOIN categorias c ON p.id_categoria = c.id_categoria 
GROUP BY c.descripcion;
```

13. Encontrar la fecha de la primera y última compra registrada
```SELECT MIN(fecha) AS "primer compra", MAX(fecha) AS "ultima compra"
FROM compras;
```
14. Calcular el total de ingresos por ventas
```SELECT SUM(cp.total) AS "total ingresos"
FROM compras_productos cp;
```
15. Contar la cantidad de compras realizadas por cada medio de pago 
```SELECT COUNT(*) AS "total compras", c.medio_pago AS "medio de pago"
FROM compras c
GROUP BY c.medio_pago;
```
16. Calcular el total de productos vendidos por cada producto
```SELECT cp.cantidad, p.nombre
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto;
```
17. Obtener el promedio de cantidad de productos comprados por compra
```SELECT AVG(cp.cantidad) AS "cantidad de productos comprados", cp.id_compra
FROM compras_productos cp
GROUP BY cp.id_compra;
```
18. Encontrar los prodcutos con el stock mas bajo
```SELECT p.nombre, p.cantidad_stock
FROM productos p
ORDER BY p.cantidad_stock ASC
LIMIT 1;
```
19. Calcular el total de productos comprados y el total gastado por cliente
```SELECT c.nombre, SUM(cp.cantidad) AS "total productos comprados", SUM(cp.total) AS "total gastado" 
FROM compras_productos cp 
JOIN compras co ON cp.id_compra = co.id_compra 
JOIN clientes c ON co.id_cliente = c.id_clientes 
GROUP BY c.id_clientes;
```

    --CONSULTAS USANDO JOIN

20. Consulta todos los productos con sus categorias y los clientes qye las realizaron
```SELECT p.id_producto, p.nombre AS producto, c.descripcion AS categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;
```
21. Consultar todas las compras y los clientes que las realizaron
```SELECT co.id_compra, co.estado, cl.nombre
FROM compras co 
JOIN clientes cl ON co.id_cliente = cl.id_clientes;
```
22. Consultar los productos comprados en cada compra
```SELECT p.nombre, cp.cantidad, cp.total 
FROM compras_productos cp 
JOIN productos p ON cp.id_producto = p.id_producto;
```
23. Consultar las compras realizadas por un cliente específico
```SELECT *
FROM compras co 
WHERE co.id_cliente = 'C003';
```
24. Consultar el total gastado por cada cliente
```SELECT c.nombre, SUM(cp.total) AS "total gastado" 
FROM compras_productos cp 
JOIN compras co ON cp.id_compra = co.id_compra 
JOIN clientes c ON co.id_cliente = c.id_clientes 
GROUP BY c.id_clientes;
```
25. Consultar el stock disponible de productos y su categoría
```SELECT p.nombre AS producto, p.cantidad_stock AS "stock", c.descripcion AS categoria 
FROM productos p 
JOIN categorias c ON p.id_categoria = c.id_categoria;
```
28. Consultar la cantidad total de productos vendidos por categoría
```SELECT c.descripcion AS categoria, SUM(cp.cantidad) AS "total productos vendidos"
FROM compras_productos cp 
JOIN productos p ON cp.id_producto = p.id_producto 
JOIN categorias c ON p.id_categoria = c.id_categoria 
GROUP BY c.id_categoria;
```
29. Consultar los clientes que han realizado compras en un rango de fechas específico
```SELECT c.nombre, co.fecha
FROM compras co 
JOIN clientes c ON co.id_cliente = c.id_clientes 
JOIN compras_productos cp ON co.id_compra = cp.id_compra 
WHERE co.fecha BETWEEN '2024-07-01 14:30:00' AND '2024-07-03 16:45:00';
```
30. Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados
```SELECT c.nombre, SUM(cp.cantidad) AS "total productos comprados", SUM(cp.total) AS "total gastado"
FROM compras_productos cp 
JOIN compras co ON cp.id_compra = co.id_compra 
JOIN clientes c ON co.id_cliente = c.id_clientes 
GROUP BY c.id_clientes;
```
31. Consultar los productos que nunca han sido comprados
```SELECT p.id_producto, p.nombre 
FROM productos p 
LEFT JOIN compras_productos cp ON p.id_producto = cp.id_producto 
WHERE cp.id_producto IS NULL;
```
34. Consultar las compras realizadas por clientes de una ciudad específica y el total gastado
```SELECT c.nombre, c.direccion, SUM(cp.total) AS "total gastado"
FROM compras co 
JOIN clientes c ON co.id_cliente = c.id_clientes 
JOIN compras_productos cp ON co.id_compra = cp.id_compra 
WHERE c.direccion LIKE '%Avenida  456%' 
GROUP BY co.id_compra;
```

    --SUBCONSULTAS

36. Consultar los productos que tienen un precio de venta superior al precio promedio de todos los productos
```SELECT p.nombre, p.precio_venta
FROM productos p
WHERE p.precio_venta > 
    (SELECT AVG(precio_venta) 
    FROM productos)
;
```
38. Consultar las categorías que tienen más de 5 productos
```SELECT c.id_categoria, c.descripcion
FROM categorias c
WHERE (SELECT COUNT(*) 
    FROM productos p 
    WHERE p.id_categoria = c.id_categoria) > 5
;
```
39. Consultar los productos más vendidos (top 5) por categoría
```SELECT p.nombre, c.descripcion AS categoria, SUM(cp.cantidad) AS "total vendidos"
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY c.id_categoria, p.id_producto
ORDER BY c.descripcion, total_vendidos DESC
LIMIT 5;
```
41. Consultar las compras y sus productos para un cliente específico, mostrando solo las compras más recientes
```SELECT co.id_compra, co.fecha, p.nombre, cp.cantidad, cp.total
FROM compras co
JOIN compras_productos cp ON co.id_compra = cp.id_compra
JOIN productos p ON cp.id_producto = p.id_producto
WHERE co.id_cliente = 'C001'
AND co.fecha = (SELECT MAX(fecha) FROM compras WHERE id_cliente = 'C001');
```
42. Consultar las categorías que tienen productos con un stock por debajo del promedio general
```SELECT c.id_categoria, c.descripcion
FROM categorias c
WHERE EXISTS (
    SELECT 1 
    FROM productos p 
    WHERE p.id_categoria = c.id_categoria 
    AND p.cantidad_stock < 
        (SELECT AVG(cantidad_stock) 
        FROM productos)
);
```
44. Consultar las compras que tienen más productos que el promedio de productos por compra
```SELECT co.id_compra, co.fecha, cp.cantidad
FROM compras co
WHERE (SELECT SUM(cp.cantidad)
       FROM compras_productos cp
       WHERE cp.id_compra = co.id_compra) > 
      (SELECT AVG(total_productos) 
       FROM (SELECT SUM(cp2.cantidad) AS total_productos 
             FROM compras_productos cp2 
             GROUP BY cp2.id_compra)
);```