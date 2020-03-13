<%@page import="java.text.DecimalFormat"%>
<%@page import="entidades.Alumno"%>
<%@page import="logic.ControladorPersona"%>
<%@page import="entidades.Curso"%>
<%@page import="entidades.InscripcionCurso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.InscripcionCarrera"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Carrera"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autogestion</title>
<link rel="stylesheet" href="css/estilo.css">
<style>
body {
    font-family: 'Roboto';font-size: 16px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("tr").each(function(){
        var nota= $(this).find("td:eq(3)").text();
		var anio=$(this).find("td:eq(0)").text();
		var anioactual=new Date().getFullYear();
        if(parseInt(anio)==anioactual)
		{
        	$(this).find("td:eq(2)").html("CURSANDO"); 
		}else{
				if(parseInt(nota)>=6)
          		{
        		$(this).find("td:eq(2)").html("APROBADO");
          		}else
          		{
          		$(this).find("td:eq(2)").html("LIBRE");
        	    }
		     }	
        });   
});
</script>
</head>
<body>
		
		<%
			ArrayList<InscripcionCarrera> inscripcionesCarrera=(ArrayList<InscripcionCarrera>)request.getAttribute("carreras");
			ArrayList<InscripcionCurso> inscripcionesCurso=(ArrayList<InscripcionCurso>)request.getAttribute("cursos");
			Alumno a=(Alumno)session.getAttribute("user");
			ControladorPersona cp=new ControladorPersona();%>
		   <h2 class="card-header text-center font-weight-bold text-uppercase py-4">Estado academico de <b><%=a.getNombre()%>, <%=a.getApellido()%></b></h2>		
			<% for(InscripcionCarrera ic:inscripcionesCarrera)
			{
			%>		
			<div class="card">
	<h3 class="card-header text-center font-weight-bold text-uppercase py-4">Esta Inscripto a:<%=ic.getCarrera().getNombre()%></h3>
  <h4 class="card-header text-center font-weight-bold text-uppercase py-4">PROMEDIO DE LA CARRERA :<%=cp.getprome(ic.getCarrera().getIdentificador(),a.getIdentificador()) %></h4>
  
  <div class="card-body">
    <div id="table" class="table-editable">
      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
            class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
            
      <table class="table table-bordered table-responsive-md table-striped text-center">
        <thead>
          <tr>
            <th class="text-center">Año</th>
            <th class="text-center">Materia</th>
            <th class="text-center">Estado</th>
            <th class="text-center">Nota</th>
          </tr>
        </thead>
        <tbody>
         <%for(InscripcionCurso insCu:inscripcionesCurso){
				if(insCu.getCurso().getIdcarrera()==ic.getCarrera().getIdentificador())
				
				{
			%>
          <tr>
            <td class="pt-3-half"><%=insCu.getFechainscripcion().getYear()+1900%></td>  
            <td class="pt-3-half"><%=insCu.getCurso().getNombre()%></td>
            <td class="pt-3-hlf"></td>
            <td class="pt-3-half"><%=insCu.getNota()%></td>
          </tr><%}}%>
        </tbody>
      </table>
      
      <%}%>
      </div>
      </div>
      </div>
			
</body>
</html>