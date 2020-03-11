/**
 * 
 */
package ejercicios;

/**
 * A. Crear una clase Alumnno con los siguientes campos
 * (con sus respectivos getters, setters y constructor)
 * 
 * Persona
 * Legajo - Integer
 * 
 *  
 * @author examen
 *
 */
public class Ejercicio3 {

	/**
	 * 
	 */
	public Ejercicio3() {
		// TODO Auto-generated constructor stub
	}

	public static class Persona{
		
		private String nombre;
		private String apellido;
		
		public Persona() {
			
		}
		
		public String getNombre() {
			return nombre;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
		public String getApellido() {
			return apellido;
		}
		public void setApellido(String apellido) {
			this.apellido = apellido;
		}

		@Override
		public String toString() {
			return "Persona [nombre=" + nombre + ", apellido=" + apellido + "]";
		}
	}
	
	public static class Alumno {
		
		public Alumno() {
			super();
		}
		
		private Persona persona;
		private int legajo;
		
		public Persona getPersona() {
			return persona;
		}
		public void setPersona(Persona persona) {
			this.persona = persona;
		}
		public int getLegajo() {
			return legajo;
		}
		public void setLegajo(int legajo) {
			this.legajo = legajo;
		}
		@Override
		public String toString() {
			return "Alumno [persona=" + persona + ", legajo=" + legajo + "]";
		}
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Alumno a=new Alumno();
		a.setLegajo(42801);
		Persona p=new Persona();
		p.setApellido("Bucci");
		p.setNombre("Elias");
		a.setPersona(p);
		System.out.println(a);
	}

}
