-- 1
SELECT apellido1, nombre, apellido2 
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1 ASC, nombre ASC, apellido2 ASC;

-- 2
SELECT apellido1, nombre, apellido2 
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3
SELECT apellido1, nombre, apellido2
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 4
SELECT apellido1, nombre, apellido2, nif
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND SUBSTRING(nif, -1) = 'K';

-- 5
SELECT nombre AS nombre_asignatura
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6
SELECT persona.apellido1, persona.nombre, persona.apellido2, departamento.nombre AS nombre_departamento
FROM persona
JOIN profesor ON persona.id = profesor.id_profesor
JOIN departamento ON profesor.id_departamento = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY apellido1 ASC, nombre ASC, apellido2 ASC;

-- 7
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
FROM alumno_se_matricula_asignatura
JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id 
JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE persona.nif = '26902806M';

-- 8
SELECT DISTINCT departamento.nombre
FROM asignatura
JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
JOIN departamento ON profesor.id_departamento = departamento.id
JOIN grado ON asignatura.id_grado = grado.id
WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 9
SELECT DISTINCT persona.nombre
FROM persona
JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

																-- consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN

-- 1
SELECT departamento.nombre AS nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 2
SELECT persona.apellido1, persona.apellido2, persona.nombre
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
WHERE persona.tipo = 'profesor' AND profesor.id_departamento IS NULL;


-- 3
SELECT departamento.nombre, profesor.id_profesor
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
WHERE profesor.id_profesor IS NULL;

-- 4
SELECT persona.apellido1, persona.apellido2, persona.nombre
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE persona.tipo = 'profesor' AND asignatura.id_profesor IS NULL;

-- 5
SELECT asignatura.nombre
FROM asignatura
LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
LEFT JOIN persona ON profesor.id_profesor = persona.id
WHERE asignatura.id_profesor IS NULL;

SELECT nombre
FROM asignatura
WHERE id_profesor IS NULL;

-- 6
SELECT DISTINCT departamento.nombre
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL;

																					-- CONSULTES RESUM
-- 1
SELECT COUNT(nombre)
FROM persona
WHERE tipo = 'alumno';

-- 2
SELECT COUNT(fecha_nacimiento)
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3
SELECT departamento.nombre AS nombre_departamento, COUNT(profesor.id_profesor) AS num_profesores
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre
HAVING num_profesores > 0
ORDER BY num_profesores DESC;

-- 4
SELECT departamento.nombre AS nombre_departamento, COUNT(profesor.id_profesor) AS num_profesores
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre
ORDER BY num_profesores DESC;

-- 5
SELECT grado.nombre AS nombre_grado, COUNT(asignatura.id) AS num_asignaturas
FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
ORDER BY num_asignaturas DESC;

-- 6
SELECT grado.nombre AS nombre_grado, COUNT(asignatura.id) AS num_asignaturas
FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
HAVING num_asignaturas > 40
ORDER BY num_asignaturas DESC;

-- 7
SELECT grado.nombre AS grado_nombre, asignatura.tipo AS tipo_de_asignatura, COUNT(asignatura.creditos) AS suma_creditos
FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre, asignatura.tipo
ORDER BY suma_creditos DESC;

-- 8
SELECT curso_escolar.anyo_inicio AS año_inicio_curso, COUNT(alumno_se_matricula_asignatura.id_alumno) AS num_alumnes_matriculats
FROM curso_escolar
LEFT JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
GROUP BY curso_escolar.anyo_inicio;

-- 9
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) AS num_asignaturas
FROM asignatura
LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
LEFT JOIN persona ON profesor.id_profesor = persona.id
GROUP BY persona.id
ORDER BY num_asignaturas DESC;

-- 10
SELECT *
FROM persona
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- 11
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2
FROM persona
JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE profesor.id_departamento IS NOT NULL AND asignatura.id IS NULL;