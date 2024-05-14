<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "syh.driverdb.DriverDB" %>
<%
request.setCharacterEncoding("euc-kr");
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

System.out.println(uid + " <-- mid login/login_action.jsp");
System.out.println(upw + "<-- mpw login/login_action.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;
String msg =null;

try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");
	System.out.println(conn + "<-- conn login_action.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_id=?");
	pstmt.setString(1, uid);
	System.out.println(pstmt + "<-- pstmt login_form.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs login_form.jsp");
	if(rs.next()){	
		System.out.println("1-1아이디 일치 조건");
		dbid = rs.getString("u_id");
		dbpw = rs.getString("u_pw");
		dblevel = rs.getString("u_level");
		dbname = rs.getString("u_name");
		dbemail = rs.getString("u_email");	
		System.out.println(dbid + "<-- dbid m_update_form.jsp");
		System.out.println(dbpw + "<-- dbpw m_update_form.jsp");
		System.out.println(dblevel + "<-- dblevel m_update_form.jsp");
		System.out.println(dbname + "<-- dbname m_update_form.jsp");
		System.out.println(dbemail + "<-- dbemail m_update_form.jsp");
		if(upw.equals(dbpw)){
			msg = "로그인 성공";
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_LEVEL", dblevel);
			session.setAttribute("S_NAME", dbname);
			}else{
				System.out.println("2-2비번 불일치 조건");
				msg = "비번 틀림";
			}
		}else{
			System.out.println("1-2아이디 불일치 조건");
			msg = "아이디 틀림";
	
		}
}catch(SQLException ex) {
out.println(ex.getMessage());
ex.printStackTrace();
} finally {
if (rs != null) try { rs.close(); } catch(SQLException ex) {}
if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
<script type = "text/javascript">
	alert('<%=msg%>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>