package data;

import java.sql.*;

public class Conectar {

	static final String URL="jdbc:postgresql://localhost:5432/postgres";
	static final String USER="postgres";
	static final String PASS="root";
	private static Conectar instancia; 
	private Connection conn=null;
	private int conectados=0;
	
	private Conectar() {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Conectar getInstancia() {
		if(instancia==null) {
			instancia=new Conectar();
		}
		return instancia;
	}
	
	public Connection getConn() {
	try {	
			if(conn==null || conn.isClosed()) 
				{
				conn=DriverManager.getConnection(URL,USER,PASS);
				conectados=0;
				}
		}catch(SQLException e) {e.printStackTrace();}	
	conectados++; 
	return conn;
	}
	
	public void releaseConn() {
		try {
			if(conectados<=0) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
}

/*	public static Connection crearConexion() throws ClassNotFoundException, SQLException{
		Class.forName("org.postgresql.Driver");
		Connection conexion=DriverManager.getConnection(URL,USER,PASS);
		if(conexion!=null) {
			System.out.println("Conexion establecida..");
			return conexion;
		}else {
			System.out.println("No conecto");
		}
		return null;	
	}	
}
*/

