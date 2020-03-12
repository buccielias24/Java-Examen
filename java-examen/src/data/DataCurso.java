package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.*;

public class DataCurso {
	
	public ArrayList<Curso> getAll(){
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Curso> cursos= new ArrayList<>();		
		try {
			stmt= Conectar.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from curso");
			if(rs!=null) {
				while(rs.next()) {
					Curso c=new Curso();
					c.setIdentificador(rs.getInt("identificador"));
					c.setCupomaximo(rs.getInt("cupomaximo"));
					c.setNombre(rs.getString("nombre"));
					c.setDescripcion(rs.getString("descripcion"));
					c.setAnio(rs.getInt("anio"));
					c.setIdcarrera(rs.getInt("idcarrera"));
					c.setIddocente(rs.getInt("iddocente"));
					cursos.add(c);
				}
			}			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				Conectar.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();}
		}		
		return cursos;
	}
	
	public Curso getById(int ID){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Curso c=new Curso();	
		try {
			stmt= Conectar.getInstancia().getConn().
					prepareStatement("select * from curso where identificador=?");
				
				stmt.setInt(1,ID);
				rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
					c.setAnio(rs.getInt("anio"));
					c.setCupomaximo(rs.getInt("cupomaximo"));
					c.setDescripcion(rs.getString("descripcion"));
					c.setIdentificador(rs.getInt("identificador"));
					c.setNombre(rs.getString("nombre"));
					c.setIdcarrera(rs.getInt("idcarrera"));
					c.setIddocente(rs.getInt("iddocente"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				Conectar.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return c;
	}
	
	public ArrayList<InscripcionCurso> getInscripciones(){
		DataAlumno da=new DataAlumno();
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<InscripcionCurso> insc_cursos= new ArrayList<>();		
		try {
			stmt= Conectar.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from inscripciones_curso");
			if(rs!=null) {
				while(rs.next()) {
					InscripcionCurso ic=new InscripcionCurso();
					ic.setFechainscripcion(rs.getDate("fechainscripcion"));
					ic.setCurso(this.getById(rs.getInt("idcurso")));
					ic.setAlumno(da.getById(rs.getInt("idalumno")));
					ic.setNota(rs.getDouble("nota"));;
					insc_cursos.add(ic);
				}
			}			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				Conectar.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();}
		}		
		return insc_cursos;
	}
	
	public ArrayList<Curso> getDisponibles(int ID){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Curso> cursos= new ArrayList<>();		
		try {
			stmt= Conectar.getInstancia().getConn().
					prepareStatement("select * from curso where identificador not in (select idcurso from inscripciones_curso where idalumno=? and nota>6)" + 
							"and curso.anio=(SELECT extract( year FROM CURRENT_DATE )::int)");
				stmt.setInt(1,ID);
				rs=stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Curso c=new Curso();
					c.setIdentificador(rs.getInt("identificador"));
					c.setCupomaximo(rs.getInt("cupomaximo"));
					c.setNombre(rs.getString("nombre"));
					c.setDescripcion(rs.getString("descripcion"));
					c.setAnio(rs.getInt("anio"));
					c.setIdcarrera(rs.getInt("idcarrera"));
					c.setIddocente(rs.getInt("iddocente"));
					cursos.add(c);
				}
			}			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				Conectar.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();}
		}		
		return cursos;
	}
	
	public void addInscripcion(Curso c,Alumno a) {
		PreparedStatement stmt= null;
		try {
			stmt=Conectar.getInstancia().getConn().
					prepareStatement(
							"insert into inscripciones_curso(idalumno,idcurso,fechainscripcion) values(?,?,now())",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, a.getIdentificador());
			stmt.setInt(2, c.getIdentificador());
			stmt.executeUpdate();
			}catch (SQLException e) {
            e.printStackTrace();
            }	finally {
                try {
                    if(stmt!=null)stmt.close();
                    Conectar.getInstancia().releaseConn();
                } catch (SQLException e) {
                	e.printStackTrace();
                }
    		}
   }
}
