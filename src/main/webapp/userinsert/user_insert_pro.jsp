<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "syh.driverdb.DriverDB" %>
<%@ page import = "syh.mdao.Mdao" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="u" class="syh.dto.User"/>
<jsp:setProperty name="u" property="*"/>

<%
	//입력 2개
	Connection conn =null;
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	Mdao mdao = new Mdao();
	mdao.uInsert(u, conn);

	/* 입력 1개
	Mdao mdao = new Mdao();
	mdao.uInsert(u);
	*/
	response.sendRedirect(request.getContextPath() + "/userlist/user_list.jsp");
%>