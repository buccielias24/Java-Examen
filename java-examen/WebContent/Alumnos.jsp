<%@page import="entidades.Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.DataAlumno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alumnos</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  
		<script type="text/javascript">
		$(document).on("submit", "#myform", function(event) {
		    var $form = $(this);

		    $.post($form.attr("action"), $form.serialize(), function(responseText) {
		        alert(responseText);
		    });
		    event.preventDefault(); // Important! Prevents submitting the form.
		   // alert("Creado");
		    
		});
		</script>
		
		<script>

$(document).ready(function(){
	  $(".thehide").hide();
	  $(document).on("click", "table button", function(){
	    $("#trigger_modal").trigger("click");
	    $("#myModal2 .modal-title").html("COMPLETE INFO");
	    $("#myModal2 .modal-body").html($("#partial_container").html());
	    $('#myModal2 input[name="apellido"]').val($(this).closest("tr").find("td:nth-child(1)").text());
	    $('#myModal2 input[name="nombre"]').val($(this).closest("tr").find("td:nth-child(2)").text());
	    $('#myModal2 input[name="tipodoc"]').val($(this).closest("tr").find("td:nth-child(4)").text());    
	    $('#myModal2 input[name="nrodoc"]').val($(this).closest("tr").find("td:nth-child(5)").text()); 
	    $('#myModal2 input[name="fechanac"]').val($(this).closest("tr").find("td:nth-child(6)").text()); 
	    $('#myModal2 input[name="identificador"]').val($(this).closest("tr").find("td:nth-child(7)").text());
	  });
	  
	});
	
</script>

<script type="text/javascript">
		$(document).on("submit", "#myform2", function(event) {
		    var $form = $(this);

		    $.post($form.attr("action"), $form.serialize(), function(responseText) {
		        alert(responseText);
		    });
		    event.preventDefault(); // Important! Prevents submitting the form.
		   // alert("Creado");
		    
		});
		</script>

</head>
<body>
<div class="container">
  <h1 class="card-header text-center font-weight-bold text-uppercase py-4">Listado</h1>
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Nuevo Alumno</h4>
        </div>
        	
<div class="form">
  	<form id="myform" action="/java-examen/registroalumno" method="post">
  		<div class="container">
    			<label><b>Nombre</b></label>
  			    <input type="text" placeholder="Ingrese nombre" name="nombre" required>
				<label><b>Apellido</b></label>
    			<input type="text" placeholder="Ingrese apellido" name="apellido" required>
    			<br><br>
				<label><b>Tipo Doc</b></label>
   				<select id="tipodoc" name="tipodoc">
    			<option value="dni" selected>DNI</option>
    			<option value="libci">Libreta Civica</option>
    			</select>
				<label><b>Numero Documento</b></label>
   				<input type="number" placeholder="numero documento" name="documento" required>
   				<br><br>
				<label><b>Fecha Nacimiento</b></label>
				<input type="date" placeholder="Fecha Nacimiento" name="fechanac" required>	
    <button type="submit"  id="idbutton" class="registerbtn">Register</button>
  </div>
</form>
</div>	
    	<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
</div>
      
    </div>
  </div>
  
  <!-- Table -->
<div class="card">
  <h3 class="card-header text-center font-weight-bold text-uppercase py-4">Alumnos</h3>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+</button>
  
  <div class="card-body">
    <div id="table" class="table-editable">
      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
            class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
      <table class="table table-bordered table-responsive-md table-striped text-center">
        <thead>
          <tr>
            <th class="text-center">Apellido</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Legajo</th>
            <th class="text-center">Tipo DOC</th>
            <th class="text-center">Numero DOC</th>
            <th class="text-center">Fecha Nac</th>
            <th class="text-center">Editar</th>
          </tr>
        </thead>
        <tbody>
            <%DataAlumno da=new DataAlumno();
 		 ArrayList<Alumno> alumnos=da.getAll();
 		 	for(Alumno a:alumnos){%>
          <tr>
            <td class="pt-3-half"><%=a.getApellido()%></td>
            <td class="pt-3-half"><%=a.getNombre()%></td>
            <td class="pt-3-half"><%=a.getLegajo()%></td>
            <td class="pt-3-half"><%=a.getTipodocumento() %></td>
            <td class="pt-3-half"><%=a.getNumerodocumento() %></td>  
            <td class="pt-3-half"><%=a.getFechanacimiento()%></td>    
            <td style="display:none;" class="pt-3-half"><%=a.getIdentificador()%></td>         
            <td>
 				<!-- Trigger the modal with a button -->
  					<div class="display_table center">
         		    <button class="btn btn-sucess">View</button>
                    </div>
  			</td>
          </tr>
            <%}%>
        </tbody>
      </table>
    </div>
  </div>
</div>
<!-- Editable table -->
 
<!-- Button trigger modal -->
<button type="button" id="trigger_modal" class="thehide btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">
</button>

<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- the partial container -->

<div class="thehide" id="partial_container">
  <form id="myform2" action="/java-examen/editaralumno" method="post">
    <fieldset>
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-12">
            <div class="form-group">
              <label>APELLIDO:</label>
              <input type="text" name="apellido" class="form-control" />
            </div>
          </div>
          <div class="col-sm-12">
            <div class="form-group">
              <label>NOMBRE:</label>
              <input type="text" name="nombre" class="form-control" />
            </div>
          </div>
          <div class="col-sm-12">
            <div class="form-group">
              <label>TIPO DOC:</label>
              <input type="text" name="tipodoc" class="form-control" />
            </div>
          </div>
          <div class="col-sm-12">
            <div class="form-group">
              <label>NRO DOC:</label>
              <input type="text" name="nrodoc" class="form-control" />
            </div>
          </div>
          <div class="col-sm-12">
            <div class="form-group">
              <label>FECHA NAC:</label>
              <input type="text" name="fechanac" class="form-control" />
            </div>
          </div>
          <input type="hidden" name="identificador" class="form-control">
        </div>
      </div>
    </fieldset>
    <div class="divider"></div>
    <div class="display_table center">
          <button type="submit" class="btn btn-sucess">Save</button>
        </div>
  </form>
</div>
  
</div>

</body>
</html>
