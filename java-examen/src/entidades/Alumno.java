package entidades;

import java.util.Date;

public class Alumno extends Persona{
	private int identificador;
	private int legajo;
	
	public Alumno() {
		super();
	}
	
	
	
	public Alumno(TipoDocumento tipodocumento, int numerodocumento, String nombre, String apellido,
			Date fechanacimiento) {
		super(tipodocumento, numerodocumento, nombre, apellido, fechanacimiento);
		// TODO Auto-generated constructor stub
	}



	public int getIdentificador() {
		return identificador;
	}
	public void setIdentificador(int identificador) {
		this.identificador = identificador;
	}
	public int getLegajo() {
		return legajo;
	}
	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}



	@Override
	public String toString() {
		return "Alumno [identificador=" + identificador + ", legajo=" + legajo + "]";
	}
	
}
