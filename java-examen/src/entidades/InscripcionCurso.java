package entidades;

import java.util.Date;

public class InscripcionCurso {

	private Alumno alumno;
	private Curso curso;
	private Date fechainscripcion;
	private double nota;
	private String estado;
	
	public InscripcionCurso() {}
	
	public Alumno getAlumno() {
		return alumno;
	}
	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public Date getFechainscripcion() {
		return fechainscripcion;
	}
	public void setFechainscripcion(Date fechainscripcion) {
		this.fechainscripcion = fechainscripcion;
	}

	@Override
	public String toString() {
		return "InscripcionCurso [alumno=" + alumno + ", curso=" + curso + ", fechainscripcion=" + fechainscripcion
				+ ", getAlumno()=" + getAlumno() + ", getCurso()=" + getCurso() + ", getFechainscripcion()="
				+ getFechainscripcion() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	public double getNota() {
		return nota;
	}

	public void setNota(double nota) {
		this.nota = nota;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	} 
	
}
