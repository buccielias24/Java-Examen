package entidades;


public class Docente extends Persona{
	private int identificador;
	private int legajo;
	
	public Docente() {
		super();
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
}

