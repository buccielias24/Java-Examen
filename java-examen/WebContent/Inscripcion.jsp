<%@page import="logic.ControladorPersona"%>
<%@page import="entidades.InscripcionCarrera"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  

<meta charset="ISO-8859-1">
<title>Inscripciones</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
		<h1 class="card-header text-center font-weight-bold text-uppercase py-4">Inscripciones</h1>
		<%
			ArrayList<InscripcionCarrera> inscripcionesCarrera=(ArrayList<InscripcionCarrera>)request.getAttribute("carreras");
			ArrayList<Curso> disponibles=(ArrayList<Curso>)request.getAttribute("disponibles");
			Alumno a=(Alumno)session.getAttribute("user");
			ControladorPersona cp=new ControladorPersona();
			for(InscripcionCarrera ic:inscripcionesCarrera)
			{
			%>		
			<div class="card">
  <h3 class="card-header text-center font-weight-bold text-uppercase py-4"><%=ic.getCarrera().getNombre()%></h3>
  <div class="card-body">
    <div id="table" class="table-editable">
      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
            class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
           
	<table class="table table-bordered table-responsive-md table-striped text-center">
        <thead>
          <tr>
            <th class="text-center">Materia</th>
            <th class="text-center">Descripcion</th>
            
          </tr>
        </thead>
        <tbody>
         <%for(Curso c:disponibles){
				if(c.getIdcarrera()==ic.getCarrera().getIdentificador())
				
				{
			%>
          <tr>
            <td class="pt-3-half"><%=c.getNombre()%></td>
            <td class="pt-3-half"><%=c.getDescripcion()%></td>
             <td>
        <div class="display_table center">
          <a id="button" href="/java-examen/inscripcion?id=<%=c.getIdentificador()%>">inscribirse</a>
        </div>
      </td>
          </tr><%}}%>
        </tbody>
      </table>
      
      <%}%>
      </div>
      </div>
      </div>
			
</body>
</html>