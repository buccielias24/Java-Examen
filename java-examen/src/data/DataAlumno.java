package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidades.*;
import entidades.Persona.TipoDocumento;


public class DataAlumno {
	
	public boolean add(Alumno a) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			
			stmt=Conectar.getInstancia().getConn().
					prepareStatement(
							"insert into alumno(idpersona,legajo) values(?,(select max(legajo)+1 from alumno))",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, a.getIdentificadorP());
			stmt.executeUpdate();	
			keyResultSet=stmt.getGeneratedKeys();
			  if(keyResultSet!=null && keyResultSet.next()){
	                a.setIdentificador(keyResultSet.getInt(1));}
			  		return true;	
	    	}catch (SQLException e) {
            e.printStackTrace();
            return false;}	finally {
                try {
                    if(keyResultSet!=null)keyResultSet.close();
                    if(stmt!=null)stmt.close();
                    Conectar.getInstancia().releaseConn();
                } catch (SQLException e) {
                	e.printStackTrace();
                }
    		}
   }
	
	public void editar(Alumno a) {
		PreparedStatement stmt= null;
		try {
			stmt=Conectar.getInstancia().getConn().prepareStatement("UPDATE alumno SET legajo=? where identificador=? ");
			stmt.setInt(1, a.getLegajo());
			stmt.setInt(2, a.getIdentificador());
			stmt.executeUpdate();			
            } catch (SQLException e) {
            e.printStackTrace();}finally {
			try {
				if(stmt!=null) {stmt.close();}
				Conectar.getInstancia().releaseConn();
				} catch (SQLException e) {
				e.printStackTrace();} 	
				}
		}
	
	public Alumno getById(int ID){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Alumno a=null;	
		try {
			stmt= Conectar.getInstancia().getConn().
					prepareStatement("select alu.identificador,pe.identificador,legajo, tipodoc, documento,nombre,apellido,fechanac from alumno alu"
							+ " inner join persona pe on alu.idpersona=pe.identificador where alu.identificador=?");
				
				stmt.setInt(1,ID);
				rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
					a=new Alumno();
					a.setApellido(rs.getString(7));
					a.setNombre(rs.getString(6));
					a.setFechanacimiento(rs.getDate(8));
					a.setIdentificador(rs.getInt(1));
					a.setIdentificadorP(rs.getInt(2));
					a.setLegajo(rs.getInt(3));
					a.setNumerodocumento(rs.getInt(5));
					String tipodoc=rs.getString(4);
					a.setTipodocumento(TipoDocumento.valueOf(tipodoc.replace(" ","").toLowerCase()));
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
		return a;
	}
	
	public ArrayList<Alumno> getAll(){
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Alumno> alumnos= new ArrayList<>();		
		try {
			stmt= Conectar.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select alu.identificador,pe.identificador,legajo, tipodoc, documento,nombre,apellido,fechanac from alumno alu"
					+ " inner join persona pe on alu.idpersona=pe.identificador");
			if(rs!=null) {
				while(rs.next()) {
					Alumno a=new Alumno();
					a.setIdentificadorP(rs.getInt(2));
					a.setIdentificador(rs.getInt(1));
					a.setLegajo(rs.getInt(3));
					a.setApellido(rs.getString("apellido"));
					a.setNombre(rs.getString("nombre"));
					a.setFechanacimiento(rs.getDate("fechanac"));
					String tipodoc=rs.getString("tipodoc").toLowerCase();
					a.setTipodocumento(TipoDocumento.valueOf(tipodoc.replace(" ",""))); 
					a.setNumerodocumento(rs.getInt("documento"));
					alumnos.add(a);
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
		return alumnos;
	}
}
