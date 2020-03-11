package entidades;

public class Curso {

		private int identificador;
		private String nombre;
		private String descripcion;
		private int cupomaximo;
		private int anio;
		private int idcarrera;
		
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

		@Override
		public String toString() {
			return "Curso [identificador=" + identificador + ", nombre=" + nombre + ", descripcion=" + descripcion
					+ ", cupomaximo=" + cupomaximo + ", anio=" + anio + "]";
		}

		public int getIdcarrera() {
			return idcarrera;
		}

		public void setIdcarrera(int idcarrera) {
			this.idcarrera = idcarrera;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + anio;
			result = prime * result + identificador;
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Curso other = (Curso) obj;
			if (anio != other.anio)
				return false;
			if (identificador != other.identificador)
				return false;
			return true;
		}
}
