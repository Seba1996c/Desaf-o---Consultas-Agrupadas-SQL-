Desafio 2

CREATE TABLE INSCRITOS
(
  cantidad INT,
  fecha DATE,
  fuente VARCHAR
);
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 44, '2021-01-01', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 56, '2021-01-01', 'Página' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 39, '2021-01-02', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 81, '2021-01-02', 'Página' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 12, '2021-01-03', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 91, '2021-01-03', 'Página' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 48, '2021-01-04', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 45, '2021-01-04', 'Página' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 55, '2021-01-05', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 33, '2021-01-05', 'Página' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 18, '2021-01-06', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 12, '2021-01-06', 'Página' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 34, '2021-01-07', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 24, '2021-01-07', 'Página' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 83, '2021-01-08', 'Blog' );
INSERT INTO INSCRITOS
  (cantidad, fecha, fuente)
VALUES
  ( 99, '2021-01-08', 'Página' );

SELECT *
FROM INSCRITOS
SELECT DISTINCT fuente
FROM INSCRITOS

SELECT COUNT(*)
FROM INSCRITOS

SELECT SUM(cantidad) AS cantidad_inscritos
FROM INSCRITOS

SELECT *
FROM INSCRITOS
WHERE fecha =
  (SELECT MIN(fecha)
from INSCRITOS)

SELECT fecha, sum(cantidad)
FROM INSCRITOS
GROUP BY fecha

SELECT fuente, sum(cantidad)
FROM INSCRITOS
GROUP BY fuente

SELECT fecha, SUM(cantidad) as cantidad_total
FROM INSCRITOS
GROUP BY fecha
HAVING SUM(cantidad) = 
  (SELECT MAX(cantidad_total)
FROM(
    SELECT fecha, sum(cantidad) as cantidad_total
  FROM INSCRITOS
  GROUP BY fecha
  )
);

SELECT fecha, SUM(cantidad) as cantidad_total
FROM INSCRITOS
WHERE fuente = 'Blog'
GROUP BY fecha
HAVING SUM(cantidad) = 
  (SELECT MAX(cantidad_total)
FROM(
    SELECT fecha, sum(cantidad) as cantidad_total
  FROM INSCRITOS
  WHERE fuente = 'Blog'
  GROUP BY fecha
  )
);

SELECT fecha, avg(cantidad)
FROM INSCRITOS
GROUP BY fecha

SELECT fecha, avg(cantidad)
FROM INSCRITOS
GROUP BY fecha
HAVING avg(cantidad) > 50;

WITH
  FechasOrdenadas
  AS
  (
    SELECT fecha, cantidad,
      ROW_NUMBER() OVER (ORDER BY fecha) AS dia
    FROM INSCRITOS
  )
SELECT fecha, AVG(cantidad) AS promedio_diario
FROM FechasOrdenadas
WHERE dia >= 3
GROUP BY fecha
ORDER BY fecha;