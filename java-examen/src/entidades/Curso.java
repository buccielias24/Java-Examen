package entidades;

public class Curso {

		private int identificador;
		private String nombre;
		private String descripcion;
		private int cupomaximo;
		private int anio;
		private int idcarrera;
		private int iddocente;
		
		public Curso() {
			super();
		}
		
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
		public int getCupomaximo() {
			return cupomaximo;
		}
		public void setCupomaximo(int cupomaximo) {
			this.cupomaximo = cupomaximo;
		}
		public int getAnio() {
			return anio;
		}
		public void setAnio(int anio) {
			this.anio = anio;
		}

		public int getIdcarrera() {
			return idcarrera;
		}

		public void setIdcarrera(int idcarrera) {
			this.idcarrera = idcarrera;
		}


		public int getIddocente() {
			return iddocente;
		}

		public void setIddocente(int iddocente) {
			this.iddocente = iddocente;
		}
}
