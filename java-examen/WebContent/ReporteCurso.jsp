<%@page import="entidades.Curso"%>
<%@page import="entidades.InscripcionCurso"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
p.p2 {
  position: relative;
  left: 300px;
}
p.p1{
  position:relative;
  left:200px;
}
</style>

</head>
<body>
<% 
	Curso curso=(Curso)request.getAttribute("detallecurso");
%>
<div class="container">
  <h2>REPORTE DEL CURSO : <%=curso.getNombre()%></h2>
  <h3><%=curso.getDescripcion()%></h3>	
  <h4>Carrera: <%=curso.getIdcarrera()%></h4>
  <br>
  <table>
  <thead>
  <tr>
  <th><p>Identificador:<%=curso.getIdentificador()%></p></th>
  <th><p class="p2">Cupo Maximo:<%=curso.getCupomaximo()%></p></th>
  <th><p class="p3">Año:<%=curso.getAnio()%></p></th>
  </tr>
  </thead>
  </table>
  <br>
 <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>ID A.</th>
        <th>ID P.</th>
        <th>NOMBRE</th>
        <th>APELLIDO</th>
        <th>LEGAJO</th>
        <th>TIPO D.</th>
        <th>NUM D.</th>
      	<th>FECHA NAC.</th>
      </tr>
    </thead> 
    <tbody>
      <%
      	ArrayList<InscripcionCurso> ic=(ArrayList<InscripcionCurso>)request.getAttribute("inscripcionescurso"); 
       	for(InscripcionCurso insc:ic)
       	{
      %>
      <tr>
        <td><%=insc.getAlumno().getIdentificador()%></td>
        <td><%=insc.getAlumno().getIdentificadorP()%></td>
        <td><%=insc.getAlumno().getNombre()%></td>
        <td><%=insc.getAlumno().getApellido()%></td>
        <td><%=insc.getAlumno().getLegajo()%></td>
        <td><%=insc.getAlumno().getTipodocumento()%></td>
        <td><%=insc.getAlumno().getNumerodocumento()%></td>
        <td><%=insc.getAlumno().getFechanacimiento()%></td> 
        <td><%=insc.getFechainscripcion()%></td>
        </tr><%}%>
    </tbody>
  </table>
  </div>
</div>

</body>
</html>
