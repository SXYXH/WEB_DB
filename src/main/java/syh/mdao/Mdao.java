package syh.mdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import syh.driverdb.DriverDB;
import syh.dto.User;

public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	//insert 입력 1개
	public void uInsert(User u) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		pstmt.setString(1, u.getUser_id());
		pstmt.setString(2, u.getUser_pw());
		pstmt.setString(3, u.getUser_level());
		pstmt.setString(4, u.getUser_name());
		pstmt.setString(5, u.getUser_email());
		pstmt.setString(6, u.getUser_phone());
		pstmt.setString(7, u.getUser_addr());
		System.out.println(pstmt + " <-- pstmt");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		System.out.println("유저 추가");
	}
	// insert 입력 2개
	public void uInsert(User u, Connection conn) throws SQLException {
		
		pstmt = conn.prepareStatement("INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		pstmt.setString(1, u.getUser_id());
		pstmt.setString(2, u.getUser_pw());
		pstmt.setString(3, u.getUser_level());
		pstmt.setString(4, u.getUser_name());
		pstmt.setString(5, u.getUser_email());
		pstmt.setString(6, u.getUser_phone());
		pstmt.setString(7, u.getUser_addr());
		System.out.println(pstmt + " <-- pstmt");
		pstmt.executeUpdate();
		pstmt.close();
		System.out.println("유저 추가");
	}
	
	public void uDelete(String u_id) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("DELETE FROM tb_user AS u WHERE u.u_id = ?");
		pstmt.setString(1, u_id);
		System.out.println(pstmt + " <--pstmt 2");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	public void uUpdate(User u) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("UPDATE tb_user AS u SET u.u_pw = ?, u.u_level = ?, u.u_name = ?, u.u_email = ?, u.u_phone = ?, u.u_addr = ? WHERE u.u_id = ?");
		System.out.println(pstmt + " <-- pstmt1");
		System.out.println(pstmt.getClass() + " <--pstmt.getClass()");
		pstmt.setString(1, u.getUser_pw());
		pstmt.setString(2, u.getUser_level());
		pstmt.setString(3, u.getUser_name());
		pstmt.setString(4, u.getUser_email());
		pstmt.setString(5, u.getUser_phone());
		pstmt.setString(6, u.getUser_addr());
		pstmt.setString(7, u.getUser_id());
		pstmt.executeUpdate();
		pstmt.close();
		
	}
}
