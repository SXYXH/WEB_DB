package syh.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("01 ����̹��ε� �� DB���� driverDbcon DriverDB.java");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/db03syh?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid03syh";
		String dbPass = "dbpw03syh";
		Connection conn = null;
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn");
		
		return conn; 
	}

}
