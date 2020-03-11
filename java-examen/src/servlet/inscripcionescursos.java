package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DataCurso;
import entidades.*;

/**
 * Servlet implementation class inscripcionescursos
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/inscripcionescursos" })
public class inscripcionescursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inscripcionescursos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		DataCurso dc=new DataCurso();
		Curso c=new Curso();
		ArrayList<InscripcionCurso> ic=new ArrayList<InscripcionCurso>();
		int id=Integer.parseInt(request.getParameter("id"));	
		c=dc.getById(id);
		for(InscripcionCurso icu:dc.getInscripciones())
			{
				if(icu.getCurso().getIdentificador()==id)
				{	
						ic.add(icu);
				}
			}	
		request.setAttribute("inscripcionescurso", ic);
		request.setAttribute("detallecurso", c);
		request.getRequestDispatcher("/ReporteCurso.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
