SELECT nombre 
FROM producto;

SELECT nombre, precio  
FROM producto;

SELECT * FROM producto;

SELECT nombre, precio AS precio_en_euros, ROUND(precio * 1.12, 2) AS precio_en_dolares
FROM producto;

SELECT nombre AS nom_de_producto, precio AS euros, ROUND(precio * 1.12, 2) AS dòlars
FROM producto;

SELECT UPPER(nombre) AS nom_en_majuscules, precio
FROM producto;

SELECT LOWER(nombre) AS nom_en_minuscules, precio
FROM producto;

SELECT nombre, UPPER(LEFT(nombre, 2)) AS 2_primers_mayus
FROM fabricante;

SELECT nombre, ROUND(precio) AS preu_arrodonit
FROM producto;

SELECT nombre, TRUNCATE(precio, 0) AS preu_sencer
FROM producto;

SELECT producto.codigo_fabricante
FROM producto;

SELECT DISTINCT producto.codigo_fabricante
FROM producto;

SELECT nombre FROM fabricante
ORDER BY nombre ASC;

SELECT nombre FROM fabricante
ORDER BY nombre DESC;

SELECT nombre, precio FROM producto
ORDER BY nombre ASC, precio DESC;

SELECT * FROM fabricante
LIMIT 5;

SELECT * FROM fabricante
LIMIT 2 OFFSET 3;

SELECT nombre, precio 
FROM producto
ORDER BY precio ASC
LIMIT 1;

SELECT nombre, precio 
FROM producto
ORDER BY precio DESC
LIMIT 1;

SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;

SELECT producto.codigo AS codigo_producto, producto.nombre AS nombre_producto, fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC
LIMIT 1;

SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;

SELECT producto.nombre AS nombre_producto
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';

SELECT producto.nombre AS nombre_producto, producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

SELECT producto.nombre AS nombre_producto, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

SELECT producto.nombre AS nombre_producto, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE SUBSTRING(fabricante.nombre, -1) = 'e';

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio > 180
ORDER BY producto.precio DESC, producto.nombre ASC;

SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante
FROM fabricante
WHERE fabricante.codigo IN (SELECT DISTINCT codigo_fabricante FROM producto);

SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto
FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.codigo IN (producto.codigo_fabricante)
ORDER BY fabricante.codigo ASC;

SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
ORDER BY fabricante.codigo ASC;

SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante
FROM fabricante
WHERE fabricante.codigo NOT IN (SELECT DISTINCT codigo_fabricante FROM producto);

SELECT nombre AS nombre_producto
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

SELECT* FROM producto
WHERE producto.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

SELECT producto.nombre AS nombre_producto
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo'
ORDER BY producto.precio DESC
LIMIT 1;

SELECT producto.nombre AS nombre_producto
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Hewlett-Packard'
ORDER BY producto.precio ASC
LIMIT 1;


SELECT producto.nombre AS nombre_producto, producto.precio
FROM producto
WHERE producto.precio >= ( SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

SELECT producto.nombre AS nombre_producto, producto.precio
FROM producto
WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus')
AND producto.precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));