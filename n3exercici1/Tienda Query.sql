-- 1 
SELECT nombre 
FROM producto;

-- 2 
SELECT nombre, precio  
FROM producto;

-- 3
SELECT * FROM producto;

-- 4
SELECT nombre, precio AS precio_en_euros, ROUND(precio * 1.12, 2) AS precio_en_dolares
FROM producto;

-- 5
SELECT nombre AS nom_de_producto, precio AS euros, ROUND(precio * 1.12, 2) AS dòlars
FROM producto;

-- 6
SELECT UPPER(nombre) AS nom_en_majuscules, precio
FROM producto;

-- 7
SELECT LOWER(nombre) AS nom_en_minuscules, precio
FROM producto;

-- 8
SELECT nombre, UPPER(LEFT(nombre, 2)) AS 2_primers_mayus
FROM fabricante;

-- 9
SELECT nombre, ROUND(precio) AS preu_arrodonit
FROM producto;

-- 10
SELECT nombre, TRUNCATE(precio, 0) AS preu_sencer
FROM producto;

-- 11
SELECT producto.codigo_fabricante
FROM producto;

-- 12
SELECT DISTINCT producto.codigo_fabricante
FROM producto;

-- 13
SELECT nombre FROM fabricante
ORDER BY nombre ASC;

-- 14
SELECT nombre FROM fabricante
ORDER BY nombre DESC;

-- 15
SELECT nombre, precio FROM producto
ORDER BY nombre ASC, precio DESC;

-- 16
SELECT * FROM fabricante
LIMIT 5;

-- 17
SELECT * FROM fabricante
LIMIT 2 OFFSET 3;

-- 18
SELECT nombre, precio 
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- 19
SELECT nombre, precio 
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 20
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

-- 21
SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22
SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;

-- 23
SELECT producto.codigo AS codigo_producto, producto.nombre AS nombre_producto, fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24
SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC
LIMIT 1;

-- 25
SELECT producto.nombre AS nombre_producto , producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;

-- 26
SELECT producto.nombre AS nombre_producto
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';

-- 27
SELECT producto.nombre AS nombre_producto, producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- 28
SELECT producto.nombre AS nombre_producto, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- 29
SELECT producto.nombre AS nombre_producto, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE SUBSTRING(fabricante.nombre, -1) = 'e';

-- 31
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio > 180
ORDER BY producto.precio DESC, producto.nombre ASC;

-- 32
SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante
FROM fabricante
WHERE fabricante.codigo IN (SELECT DISTINCT codigo_fabricante FROM producto);

-- 33
SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto
FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.codigo IN (producto.codigo_fabricante)
ORDER BY fabricante.codigo ASC;

-- 34
SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
ORDER BY fabricante.codigo ASC;

-- 35
SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante
FROM fabricante
WHERE fabricante.codigo NOT IN (SELECT DISTINCT codigo_fabricante FROM producto);

-- 36
SELECT nombre AS nombre_producto
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 37
SELECT* FROM producto
WHERE producto.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 38
SELECT producto.nombre AS nombre_producto
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo'
ORDER BY producto.precio DESC
LIMIT 1;

-- 39
SELECT producto.nombre AS nombre_producto
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Hewlett-Packard'
ORDER BY producto.precio ASC
LIMIT 1;

-- 40
SELECT producto.nombre AS nombre_producto, producto.precio
FROM producto
WHERE producto.precio >= ( SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 41
SELECT producto.nombre AS nombre_producto, producto.precio
FROM producto
WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus')
AND producto.precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));