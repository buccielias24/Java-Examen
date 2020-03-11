package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Carrera;
import entidades.InscripcionCarrera;

public class DataCarrera {

	public ArrayList<InscripcionCarrera> getInscripciones(){
		DataAlumno da=new DataAlumno();
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<InscripcionCarrera> insc_carrera= new ArrayList<>();		
		try {
			stmt= Conectar.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from inscripciones_carrera");
			if(rs!=null) {
				while(rs.next()) {
					InscripcionCarrera ic=new InscripcionCarrera();
					ic.setFechainscripcion(rs.getDate("fechainscripcion"));
					ic.setCarrera(this.getById(rs.getInt("idcarrera")));
					ic.setAlumno(da.getById(rs.getInt("idalumno")));
					insc_carrera.add(ic);
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
		return insc_carrera;
	}
		
	public Carrera getById(int ID){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Carrera c=new Carrera();
		try {
			stmt= Conectar.getInstancia().getConn().
					prepareStatement("select * from carrera where identificador=?");
				
				stmt.setInt(1,ID);
				rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
					c.setIdentificador(rs.getInt("identificador"));
					c.setFechadesde(rs.getDate("fechadesde"));
					c.setFechahasta(rs.getDate("fechahasta"));
					c.setNombre(rs.getString("nombre"));
					c.setDescripcion(rs.getString("descripcion"));
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
	
}
