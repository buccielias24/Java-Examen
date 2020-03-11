package data;

import java.sql.*;
import entidades.*;
import entidades.Persona.TipoDocumento;

public class DataPersona {

	public boolean add(Alumno a) {
		DataAlumno da=new DataAlumno();
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=Conectar.getInstancia().getConn().
					prepareStatement(
							"insert into persona(tipodoc,documento,nombre,apellido,fechanac) values(?,?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, a.getTipodocumento().toString());
			stmt.setInt(2, a.getNumerodocumento());
			stmt.setString(3, a.getNombre());
			stmt.setString(4, a.getApellido());
			stmt.setDate(5, new java.sql.Date(a.getFechanacimiento().getTime()));
			stmt.executeUpdate();
			keyResultSet=stmt.getGeneratedKeys();
			 if(keyResultSet!=null && keyResultSet.next()){
	                a.setIdentificadorP(keyResultSet.getInt(1));
	                da.add(a);}
			  		
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
			stmt=Conectar.getInstancia().getConn().prepareStatement("UPDATE persona SET nombre=?,apellido=?,fechanac=?,tipodoc=?,documento=? where identificador=? ");
			stmt.setString(1,a.getNombre());
			stmt.setString(2, a.getApellido());
			stmt.setDate(3, new java.sql.Date(a.getFechanacimiento().getTime()));
			stmt.setString(4,a.getTipodocumento().toString());
			stmt.setInt(5, a.getNumerodocumento());
			stmt.setInt(6, a.getIdentificadorP());
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
	
	public Docente getDocenteById(int ID){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Docente docente=null;
		try {
			stmt= Conectar.getInstancia().getConn().
					prepareStatement("select doc.identificador,pe.identificador,legajo, tipodoc, documento,nombre,apellido,fechanac from docente doc"
							+ " inner join persona pe on doc.idpersona=pe.identificador where doc.identificador=?");
				
				stmt.setInt(1,ID);
				rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
					docente=new Docente();
					docente.setApellido(rs.getString(7));
					docente.setNombre(rs.getString(6));
					docente.setFechanacimiento(rs.getDate(8));
					docente.setIdentificador(rs.getInt(1));
					docente.setIdentificadorP(rs.getInt(2));
					docente.setLegajo(rs.getInt(3));
					docente.setNumerodocumento(rs.getInt(5));
					String tipodoc=rs.getString(4);
					docente.setTipodocumento(TipoDocumento.valueOf(tipodoc.replace(" ","").toLowerCase()));
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
		return docente;
	}
	
}
