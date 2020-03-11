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
 * Servlet implementation class inscripcion
 */
@WebServlet("/inscripcion")
public class inscripcion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inscripcion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int ID=Integer.parseInt(request.getParameter("id"));
		ControladorPersona cp=new ControladorPersona();
		HttpSession session=request.getSession(false);
		Alumno a=(Alumno)session.getAttribute("user");
		if(cp.addCurso(ID,a)) {
		response.setContentType("text/plain");
		response.getWriter().write("Inscripto");
		//RequestDispatcher rd=request.getRequestDispatcher("index.html");
		//rd.forward(request,response);
		}
		else {
			response.setContentType("text/plain");
			response.getWriter().write("no hay cupo");}
		//	RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
	//	rd.forward(request,response);}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
