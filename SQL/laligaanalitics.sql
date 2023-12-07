
ALTER TABLE resultados
ADD COLUMN ID_partido INT;
ALTER TABLE resultados
MODIFY COLUMN ID_partido INT FIRST;
ALTER TABLE resultados
DROP PRIMARY KEY,
ADD PRIMARY KEY (ID_partido);

select * from resultados