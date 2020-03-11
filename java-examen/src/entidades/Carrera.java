package entidades;

import java.util.Date;

public class Carrera {
 
	private int identificador;
	private String nombre;
	private String descripcion;
	private Date fechadesde;
	private Date fechahasta;
	
	
	public int getIdentificador() {
		return identificador;
	}
	public void setIdentificador(int identificador) {
		this.identificador = identificador;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Date getFechadesde() {
		return fechadesde;
	}
	public void setFechadesde(Date fechadesde) {
		this.fechadesde = fechadesde;
	}
	public Date getFechahasta() {
		return fechahasta;
	}
	public void setFechahasta(Date fechahasta) {
		this.fechahasta = fechahasta;
	}
	@Override
	public String toString() {
		return "Carrera [identificador=" + identificador + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ ", fechadesde=" + fechadesde + ", fechahasta=" + fechahasta + "]";
	}
	
}
