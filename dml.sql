INSERT INTO categorias (id_categoria, descripcion, estado) VALUES (1, 'Electrónica', 1);
INSERT INTO categorias (id_categoria, descripcion, estado) VALUES (2, 'Ropa', 1);
INSERT INTO categorias (id_categoria, descripcion, estado) VALUES (3, 'Hogar', 1);

INSERT INTO clientes (id_clientes, nombre, apellidos, celular, direccion, correo_electronico) 
VALUES ('C001', 'Juan', 'Pérez Gómez', 1234567890, 'Calle  123', 'juan.perez@gmail.com');
INSERT INTO clientes (id_clientes, nombre, apellidos, celular, direccion, correo_electronico) 
VALUES ('C002', 'María', 'López Fernández', 2345678901, 'Avenida  456', 'maria.lopez@gmail.com');
INSERT INTO clientes (id_clientes, nombre, apellidos, celular, direccion, correo_electronico) 
VALUES ('C003', 'Pedro', 'García Martínez', 3456789012, 'Carrera 789', 'pedro.garcia@gmail.com');

INSERT INTO compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) 
VALUES (1, 'C001', '2024-07-01 14:30:00', 'T', 'Compra realizada', 'A');
INSERT INTO compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) 
VALUES (2, 'C002', '2024-07-02 09:15:00', 'C', 'Pedido entregado', 'P');
INSERT INTO compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) 
VALUES (3, 'C003', '2024-07-03 16:45:00', 'T', 'Compra en espera', 'E');

INSERT INTO productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) 
VALUES (1, 'Smartphone X', 1, '1234567890123', 499.99, 50, 1);
INSERT INTO productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) 
VALUES (2, 'Camisa', 2, '2345678901234', 29.99, 100, 1);
INSERT INTO productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) 
VALUES (3, 'Sofa', 3, '3456789012345', 799.99, 10, 1);

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado) 
VALUES (1, 1, 1, 499.99, 1);
INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado) 
VALUES (2, 2, 3, 89.97, 1);
INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado) 
VALUES (3, 3, 1, 799.99, 1);

