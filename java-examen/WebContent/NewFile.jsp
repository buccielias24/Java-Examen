<%@page import="data.DataPersona"%>
<%@page import="entidades.InscripcionCurso"%>
<%@page import="entidades.Curso"%>
<%@page import="data.DataCurso"%>
<%@page import="entidades.Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.DataAlumno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cursos</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/estilo.css">
<style>
body {
    font-family: 'Roboto';font-size: 22px;
}
</style>
</head>
<body>
<div class="container">
<h3 class="card-header text-center font-weight-bold text-uppercase py-4"><b>CURSOS ACTUALES</b></h3>
<table class="table table-hover table-bordered table-responsive-md text-center">
  <thead>
    <tr>
      <th class="text-center">Nombre</th>
      <th class="text-center">Descipcion</th>
      <th class="text-center">Cupo</th>
      <th class="text-center">Año</th>
      <th class="text-center">Docente</th>
      <th class="text-center">info</th> 
    </tr>
  </thead>
   <tbody> 
            <%DataCurso dc=new DataCurso();
              DataPersona dp=new DataPersona();
 		 ArrayList<Curso> cursos=dc.getAll();
 		 	for(Curso c:cursos){%>
    <tr>
            <td class="pt-3-half"><%=c.getNombre()%></td>
            <td class="pt-3-half"><%=c.getDescripcion()%></td>
            <td class="pt-3-half"><%=c.getCupomaximo()%></td>
            <td class="pt-3-half"><%=c.getAnio()%></td>  	
            <td class="pt-3-half"><%=dp.getDocenteById(c.getIddocente()).getApellido()%></td>
           <td>
        <div class="display_table center">
          <a href="/java-examen/inscripcionescursos?id=<%=c.getIdentificador()%>">Ver</a>
        </div>
      </td>
    </tr><%}%>
  </tbody>
</table>
<!-- Table -->
</div>
</body>
</html>