package entidades;

import java.util.Date;

public class Persona {
	private int identificadorP;
	private  TipoDocumento tipodocumento;
	private int numerodocumento;
	private String nombre;
	private String apellido;
	private Date fechanacimiento;
	
	public Persona() {}
		
	public Persona(TipoDocumento tipodocumento, int numerodocumento, String nombre, String apellido,
			Date fechanacimiento) {
		this.tipodocumento = tipodocumento;
		this.numerodocumento = numerodocumento;
		this.nombre = nombre;
		this.apellido = apellido;
		this.fechanacimiento = fechanacimiento;
	}



	public enum TipoDocumento{
		dni,
		lc;
	}


	public int getIdentificadorP() {
		return identificadorP;
	}


	public void setIdentificadorP(int identificador) {
		this.identificadorP = identificador;
	}


	public TipoDocumento getTipodocumento() {
		return tipodocumento;
	}


	public void setTipodocumento(TipoDocumento tipodocumento) {
		this.tipodocumento = tipodocumento;
	}


	public int getNumerodocumento() {
		return numerodocumento;
	}


	public void setNumerodocumento(int numerodocumento) {
		this.numerodocumento = numerodocumento;
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


	public Date getFechanacimiento() {
		return fechanacimiento;
	}


	public void setFechanacimiento(Date fechanacimiento) {
		this.fechanacimiento = fechanacimiento;
	}

	@Override
	public String toString() {
		return "Persona [identificadorP=" + identificadorP + ", tipodocumento=" + tipodocumento + ", numerodocumento="
				+ numerodocumento + ", nombre=" + nombre + ", apellido=" + apellido + ", fechanacimiento="
				+ fechanacimiento + "]";
	}
}

