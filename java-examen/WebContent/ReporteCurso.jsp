<%@page import="entidades.Curso"%>
<%@page import="entidades.InscripcionCurso"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cursos</title>
<link rel="stylesheet" href="css/estilo.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/estilo.css">
	
<style type="text/css">
p.p2 {
  position: relative;
  left: 300px;
}
p.p1{
  position:relative;
  left:200px;
body{
font-family: 'Roboto';font-size: 50px;
  }
</style>
</head>
<body>
<% 
	Curso curso=(Curso)request.getAttribute("detallecurso");
%>
<div class="container">
  <h2 class="card-header text-center font-weight-bold text-uppercase py-4">REPORTE DEL CURSO : <%=curso.getNombre()%></h2>
  <h3 class="card-header text-center font-weight-bold text-uppercase py-4"><%=curso.getDescripcion()%></h3>	
  <br>
  <%		ArrayList<Integer> anios=(ArrayList<Integer>)request.getAttribute("anios");
  			for(Integer anio:anios)
  				{
  %>
  <table>
  <thead>
  <tr>
  <th><p >Cupo Maximo:<b><%=curso.getCupomaximo()%><b></b></p></th>
  <th><p class="p2">A�o:<b><%=anio+1900%></b></p></th>
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
      	<th>FECHA INSCRIPCION</th>
      </tr>
    </thead> 
    <tbody>
      <%
      	ArrayList<InscripcionCurso> ic=(ArrayList<InscripcionCurso>)request.getAttribute("inscripcionescurso"); 
       	for(InscripcionCurso insc:ic)
       	{
      			if(insc.getFechainscripcion().getYear()==anio)
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
        </tr><%}}%>
    </tbody>
  </table>
  <%}%>
  </div>
</div>

</body>
</html>
