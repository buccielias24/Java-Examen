package logic;
import java.time.Year;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import data.*;
import entidades.*;
import servlet.inscripcionescursos;
public class ControladorPersona {

	private DataPersona dp;
	private DataAlumno da;
	private DataCarrera dc;
	private DataCurso dcu;
	
	public ControladorPersona() {	
		da=new DataAlumno();
		dp=new DataPersona();
		dc=new DataCarrera();
		dcu=new DataCurso();
	}
	
	public boolean add(Alumno a)
	{
		if(this.validarNuevoAlumno(a))
			{dp.add(a);
			return true;
			}else {return false;}
	}
	
	public Alumno getById(int ID)
	{
		return da.getById(ID);
	}
	
	public boolean edit(Alumno a)
	{
		boolean igual=false;
		for(Alumno alumnos:da.getAll())
		{
			if(alumnos.getIdentificador()!=a.getIdentificador())
			{
				if(alumnos.getNumerodocumento()==a.getNumerodocumento() || alumnos.getLegajo()==a.getLegajo())
				{
					igual=true;
					break;
				}
			}
		}
		if(igual==false)
		{	dp.editar(a);
			da.editar(a);
			return true; 
		}
		else
		{
		return false;
		}
	}
	
	
	public boolean esValido(int legajo, int documento)
	{
		boolean validar=false;
		ArrayList<Alumno> alumnos=da.getAll();
			for(Alumno a:alumnos)
			{
				if(a.getLegajo()==legajo && a.getNumerodocumento()==documento)
				{
					validar=true;
					break;
				}
			}
			return validar;
	}
	
	public Alumno getByLegajo(int legajo)
	{
		Alumno a =null;
		ArrayList<Alumno> alumnos=da.getAll();
		for(Alumno alu:alumnos)
		{
			if(alu.getLegajo()==legajo)
			{
				a=alu;
			}
		}
		return a;
	}


	public boolean addCurso(int ID, Alumno a)
	{	
		if(this.validarNuevaInscripcion(dcu.getById(ID),a))
		{
			dcu.addInscripcion(dcu.getById(ID),a);
			return true;
		}else return false;
	}
	
	
	
	public ArrayList<InscripcionCarrera>getInscripcionesCarrera(int ID)
	{
		ArrayList<InscripcionCarrera> inscripciones=new ArrayList<InscripcionCarrera>();
		for(InscripcionCarrera insc: dc.getInscripciones())		
		{
			if(insc.getAlumno().getIdentificador()==ID)
			{
				inscripciones.add(insc);
			}
		}
		return inscripciones;
	}
	
	public ArrayList<InscripcionCurso>getInscripcionesCurso(int ID)
	{
		ArrayList<InscripcionCurso> inscripciones=new ArrayList<InscripcionCurso>();
		for(InscripcionCurso insc: dcu.getInscripciones())
		{
			if(insc.getAlumno().getIdentificador()==ID)
			{
				inscripciones.add(insc);
			}
		}
		return inscripciones;
	}
	
	public double getprome(int idcarrera, int ID)
	{
	//promedio de todos los cursos realizados por el alumno para una carrera
			int contador=0;
			double total=0;		
			int anioactual=Year.now().getValue();
			for(InscripcionCurso ic: this.getInscripcionesCurso(ID))
				{
				   if(ic.getAlumno().getIdentificador()==ID && ic.getCurso().getIdcarrera()==idcarrera)
						{
					      // se calcula el promedio de las materias cuya inscripcion sean anteriores al anio actual
					   	 	if(ic.getFechainscripcion().getYear()+1900<anioactual)
					   			{total=total+ic.getNota();   
					   			contador++;	
					   			}			
						}
				}
			return total/contador;
	}
	
	public boolean validarNuevoAlumno(Alumno a)
	{
		boolean validar=true;
		for(Alumno alum:da.getAll())
		{
			if(alum.getNumerodocumento()==a.getNumerodocumento()&&alum.getTipodocumento()==a.getTipodocumento())
			{
				validar=false;
			}
		}
		return validar;
	}
	
	public ArrayList<Curso> getCursosDisponibles(int ID)
	{
		return dcu.getDisponibles(ID);
	}
	
	public boolean validarNuevaInscripcion(Curso c, Alumno a)
	{
		boolean validar=false;
		
		if(this.existeInscripcion(c, a))
		{
			if(this.validarCupo(c))
			{
				validar=true;
			}
		}
		return validar;
	}
	
	public boolean existeInscripcion(Curso c, Alumno a)
	{
		boolean validar=true;
		Date ahora=new Date();
		
		for(InscripcionCurso ins_c:dcu.getInscripcionesAlumno(a.getIdentificador()))
		{
				if(ins_c.getCurso().getIdentificador()==c.getIdentificador() && ins_c.getFechainscripcion().getYear()==ahora.getYear())
				{
					
					validar=false;
				}
		}
		return validar;
	}
	
	public ArrayList<Integer> getAnios(Curso c)
	{
		ArrayList<Integer> anios=new ArrayList<Integer>();
		for(InscripcionCurso ic:dcu.getInscripciones())
		{
			if (ic.getCurso().getIdentificador()==c.getIdentificador())
			{
				anios.add(ic.getFechainscripcion().getYear());
			}
		}
		Set<Integer> hashSet = new HashSet<Integer>(anios);
        anios.clear();
        anios.addAll(hashSet);
        Collections.sort(anios);
		return anios;
	}
	
	public boolean validarCupo(Curso c)
	{
		boolean validar=true;
		int total=0;
		Date anioactual=new Date();
		for(InscripcionCurso ins_c:dcu.getInscripciones())			
		{
			if(ins_c.getCurso().getIdentificador()==c.getIdentificador() && anioactual.getYear()==ins_c.getFechainscripcion().getYear())
			{
				total++;
			}
		}
		if (c.getCupomaximo()<=total)
		{
			validar=false;
		}
		return validar;
	}
}
