package logic;
import java.util.ArrayList;
import data.*;
import entidades.*;
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
	
	public void edit(Alumno a)
	{
		dp.editar(a);
		da.editar(a);
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

	public ArrayList<Curso> getCursosDisponibles(int ID)
	{
			return dcu.getDisponibles(ID);
	}
	
	public boolean addCurso(int ID, Alumno a)
	{	
		if(this.validarInscripcion(dcu.getById(ID)))
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
			for(InscripcionCurso ic: this.getInscripcionesCurso(ID))
				{
				   if(ic.getAlumno().getIdentificador()==ID && ic.getCurso().getIdcarrera()==idcarrera)
						{
					   	 	
					   			total=total+ic.getNota();   
					   			contador++;	
					   					
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
	
	public boolean validarInscripcion(Curso c)
	{
		boolean validar=true;
		int total=0;
		for(InscripcionCurso ins_c:dcu.getInscripciones())			
		{
			if(ins_c.getCurso().getIdentificador()==c.getIdentificador())
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
