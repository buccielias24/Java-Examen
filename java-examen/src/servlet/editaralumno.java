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
 * Servlet implementation class editaralumno
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/editaralumno" })
public class editaralumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editaralumno() {
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
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		TipoDocumento tipodoc=TipoDocumento.valueOf(request.getParameter("tipodoc"));
		int numdoc=Integer.parseInt(request.getParameter("nrodoc"));
		Date fechanac=null;
		int legajo=Integer.parseInt(request.getParameter("legajo"));
		int id=Integer.parseInt(request.getParameter("identificador"));
		try {
			fechanac=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechanac"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		Alumno a=new Alumno();
		a=ctrl.getById(id);
		a.setNombre(nombre);
		a.setApellido(apellido);
		a.setIdentificador(id);
		a.setTipodocumento(tipodoc);
		a.setNumerodocumento(numdoc);
		a.setFechanacimiento(fechanac);
		a.setLegajo(legajo);
		if(ctrl.edit(a))
		{
			response.setContentType("text/plain");
			response.getWriter().write("Editado");	
		} else 
		{
			response.setContentType("text/plain");
			response.getWriter().write("Datos duplicados por favor chequear");
		}
	}

}
