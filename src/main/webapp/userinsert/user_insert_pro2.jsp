<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_level = request.getParameter("user_level");
	String user_name = request.getParameter("user_name");
	String user_email = request.getParameter("user_email");
	String user_phone = request.getParameter("user_phone");
	String user_addr = request.getParameter("user_addr");
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/db03syh?" + 
				"useUnicode=true&characterEncoding=utf-8";
		String dbUser = "dbid03syh";
		String dbPass = "dbpw03syh";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + " <-- conn");
		System.out.println(conn.getClass() + " <-- conn.getClass()");
		
		pstmt = conn.prepareStatement("INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		pstmt.setString(1, user_id);
		pstmt.setString(2, user_pw);
		pstmt.setString(3, user_level);
		pstmt.setString(4, user_name);
		pstmt.setString(5, user_email);
		pstmt.setString(6, user_phone);
		pstmt.setString(7, user_addr);
		System.out.println(pstmt + " <-- pstmt");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + " <-- result");
	}catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException e){}
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}
	
	response.sendRedirect(request.getContextPath() + "/userlist/user_list.jsp");
%>