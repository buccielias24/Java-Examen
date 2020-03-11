package ejercicios;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * A. Crear una clase Persona con los siguientes campos
 * (con sus respectivos getters, setters y constructor)
 * 
 * TipoDocumento - enum (dni/libretacivica) 
 * NroDocumento - Integer
 * Nombre - String
 * Apellido - String
 * FechaNacimiento - Date
 * 
 * B. En el método main de la clase "Ejercicio2" crear una nueva instancia
 * de la clase persona y settearle valores reales con tus datos
 * 
 * 
 * C. En el método main de la clase "Ejercicio 2" imprimir los valores en 
 * consola 
 * (crear método main e imprimir valores) 
 *  
 * @author examen
 *
 */
public class Ejercicio2 {

	/**
	 * 
	 */
	public Ejercicio2() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static class Persona{
		private TiposDocumento TipoDocumento;
		private int NroDocumento;
		private String Nombre;
		private String Apellido;
		private Date FechaNacimiento;
		
		public Persona() {}

		public TiposDocumento getTipoDocumento() {
			return TipoDocumento;
		}

		public void setTipoDocumento(TiposDocumento tipoDocumento) {
			TipoDocumento = tipoDocumento;
		}

		public int getNroDocumento() {
			return NroDocumento;
		}

		public void setNroDocumento(int nroDocumento) {
			NroDocumento = nroDocumento;
		}

		public String getNombre() {
			return Nombre;
		}

		public void setNombre(String nombre) {
			Nombre = nombre;
		}

		public String getApellido() {
			return Apellido;
		}

		public void setApellido(String apellido) {
			Apellido = apellido;
		}

		public Date getFechaNacimiento() {
			return FechaNacimiento;
		}

		public void setFechaNacimiento(Date fechaNacimiento) {
			FechaNacimiento = fechaNacimiento;
		}

		@Override
		public String toString() {
			return "Persona [TipoDocumento=" + TipoDocumento + ", NroDocumento=" + NroDocumento + ", Nombre=" + Nombre
					+ ", Apellido=" + Apellido + ", FechaNacimiento=" + FechaNacimiento + "]";
		}
		
	}
	
	enum TiposDocumento{
		dni,
		libretacivica
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Persona p=new Persona();
		p.setApellido("Bucci");
		p.setNombre("Elias");
		
		String pattern="dd/MM/yyyy";
		SimpleDateFormat format=new SimpleDateFormat(pattern);
		try{p.setFechaNacimiento(format.parse("17/07/1993"));
		}catch(Exception e) {
		System.out.println("Fecha Invalida");}
		
		p.setNroDocumento(37336261);
		p.setTipoDocumento(TiposDocumento.dni);
		System.out.println(p);
	}

}
