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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>


<table class="table table-hover">
  <thead>
    <tr>
      <th class="text_align_center text_transform_uppercase">Nombre</th>
      <th class="text_align_center text_transform_uppercase">Descipcion</th>
      <th class="text_align_center text_transform_uppercase">Cupo Maximo</th>
      <th class="text_align_center text_transform_uppercase">Año</th>
      <th class="text_align_center text_transform_uppercase">Docente</th>
      <th class="text_align_center text_transform_uppercase">Mas info</th> 
      
      <th></th>
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
</body>
</html>