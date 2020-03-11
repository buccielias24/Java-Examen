package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Alumno;
import logic.ControladorPersona;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		ControladorPersona cp=new ControladorPersona();
		int legajo=Integer.parseInt(request.getParameter("legajo"));
		int documento=Integer.parseInt(request.getParameter("documento"));
		int opcion=Integer.parseInt(request.getParameter("accion"));
		if(cp.esValido(legajo, documento))
		{
			switch(opcion)
				{
					case 1:{
						Alumno a=cp.getByLegajo(legajo);
						request.setAttribute("cursos", cp.getInscripcionesCurso(a.getIdentificador()));
						request.setAttribute("carreras",cp.getInscripcionesCarrera(a.getIdentificador()));
						HttpSession misession= request.getSession();
						misession.setAttribute("user",cp.getByLegajo(legajo));
						RequestDispatcher rd=request.getRequestDispatcher("Autogestion.jsp");
						rd.forward(request,response);	
					} break;
					case 2:{
						Alumno a=cp.getByLegajo(legajo);
						request.setAttribute("carreras",cp.getInscripcionesCarrera(a.getIdentificador()));
						request.setAttribute("disponibles", cp.getCursosDisponibles(a.getIdentificador()));
						HttpSession misession= request.getSession();
						misession.setAttribute("user",cp.getByLegajo(legajo));
						RequestDispatcher rd=request.getRequestDispatcher("Inscripcion.jsp");
						rd.forward(request,response);
					} break;
				}
		}else {
					RequestDispatcher rd=request.getRequestDispatcher("index.html");
					rd.forward(request,response);
				}
	}
		
	

}
