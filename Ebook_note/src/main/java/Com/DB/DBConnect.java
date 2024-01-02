package Com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect{
	private static Connection conn;
	public static Connection getConn() {
		if(conn==null) {
			try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/enotes","Roshani","1235");
			
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
		/*
		 * else { try { conn.close(); }catch(Exception e) { e.printStackTrace(); } }
		 */
		
		return conn;
	}
	
	public static void main(String args[]) {
		System.out.println(getConn());
	}
}