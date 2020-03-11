----EJERCICIOS
-- SOLO ES REQUERIDO REALIZAR LOS EJERCICIOS DE COMPLEJIDAD BAJA, realizar los demas ejercicios serán puntos extras para la evaluación del examen.


--- EJERCICIO 1 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todos los alumnos existentes, mostrar: TipoDoc, Documento, Nombre, Apellido, Legajo.
select tipodoc,documento,nombre,apellido,legajo from alumno a inner join persona p 
on a.identificador=p.identificador;
--- EJERCICIO 2 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todas las carreras a la que un alumno esta inscripto, mostrar: Legajo, nombre, apellido, nombre carrera, fechainscripcioncarrera
--ordenado por legajo descendiente
select legajo,p.nombre, apellido, fechainscripcion,c.nombre from persona p
	inner join alumno a on p.identificador=a.identificador 
		inner join inscripciones_carrera ic on ic.idalumno=a.identificador
			inner join carrera c on c.identificador=ic.idcarrera
				order by 1 desc;
--- EJERCICIO 3 - COMPLEJIDAD MEDIA: 
-- Realizar una consulta para consultar la cantidad de inscriptos por curso, mostrando: nombre carrera, nombre curso, cantidad inscriptos, cupo máximo por curso
  select ca.nombre,cu.nombre,cu.cupomaximo,count(ic.idalumno) from inscripciones_curso ic 
  	   inner join curso cu on ic.idcurso=cu.identificador
	   	inner join carrera ca on ca.identificador=cu.idcarrera
				group by 1,2,3;

--- EJERCICIO 4 - COMPLEJIDAD ALTA: 
--Sobre la consulta anterior (copiar y pegarla y modificarla) modificar la sql para que la consulta retorne solo los cursos cuya cantidad de inscripciones 
--supera su cupo maximo
  select ca.nombre,cu.nombre,cu.cupomaximo,count(ic.idalumno) from inscripciones_curso ic 
  	   inner join curso cu on ic.idcurso=cu.identificador
	   	inner join carrera ca on ca.identificador=cu.idcarrera
				group by 1,2,3	
					having count(ic.idalumno)>cu.cupomaximo;
--- EJERCICIO 5 -  COMPLEJIDAD BAJA: 
-- actualizar todos las cursos que posean anio 2018 y cuyo cupo sea menor a 5, y actualizar el cupo de todos ellos a 10 

	update curso set cupomaximo=10 where identificador in (
	select identificador from curso where anio=2018 and cupomaximo<5);

--- EJERCICIO 6 -  COMPLEJIDAD ALTA: 
-- actualizar todas las fechas de inscripcion a cursados que posean el siguiente error: la fecha de inscripcion al cursado de un 
-- alumno es menor a la fecha de inscripcion a la carrera. La nueva fecha que debe tener es la fecha del dia. Se puede hacer en dos pasos, primero
-- realizando la consulta y luego realizando el update manual


CREATE TEMP TABLE temporal
(idalum int,idcur int, fechains Date);

Insert into temporal(
select a.identificador,ins_cu.idcurso,ins_cu.fechainscripcion
from alumno a inner join inscripciones_curso ins_cu on ins_cu.idalumno=a.identificador
inner join curso c on c.identificador=ins_cu.idcurso
inner join carrera ca on c.idcarrera=ca.identificador
inner join inscripciones_carrera ins_ca on ins_ca.idalumno=a.identificador and ins_ca.idcarrera=ca.identificador
where ins_ca.fechainscripcion>ins_cu.fechainscripcion
order by 2);

UPDATE inscripciones_curso set fechainscripcion=now() from temporal where idcurso=temporal.idcur and idalumno=temporal.idalum and fechainscripcion=temporal.fechains;

--- EJERCICIO 7 - COMPLEJIDAD BAJA:  
--INSERTAR un nuevo registro de alumno con tus datos personales, (hacer todos inserts que considera necesario)

Insert into persona(identificador,tipodoc,documento,nombre,apellido,fechanac) values((select max(identificador)+1 from persona),'dni',37336261,'Elias','Bucci','1993-07-17');
Insert into alumno(identificador,idpersona,legajo) values((select max(identificador)+1 from alumno),(select max(identificador)from persona),42801);
--- EJERCICIO 8 -  COMPLEJIDAD BAJA: 
-- si se desea comenzar a persistir de ahora en mas el dato de direccion de un alumno y considerando que este es un único cambio string de 200 caracteres.
-- Determine sobre que tabla seria mas conveniente persistir esta información y realizar la modificación de estructuras correspondientes.
Alter table persona 
add column direccion varchar(200);