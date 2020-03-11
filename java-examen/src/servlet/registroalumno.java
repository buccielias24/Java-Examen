package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Alumno;
import entidades.Persona.TipoDocumento;
import logic.ControladorPersona;

/**
 * Servlet implementation class registroalumno
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/registroalumno" })
public class registroalumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registroalumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ControladorPersona ctrl=new ControladorPersona();
		TipoDocumento tipodoc=TipoDocumento.valueOf(request.getParameter("tipodoc"));
		Integer documento=Integer.parseInt(request.getParameter("documento"));
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		Date fechanac=null;
		try {
			fechanac=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechanac"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		Alumno a=new Alumno(tipodoc,documento,nombre,apellido,fechanac);
		ctrl.add(a);
		response.sendRedirect("Alumnos.jsp");
	}

}
