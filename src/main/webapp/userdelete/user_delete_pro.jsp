<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "syh.driverdb.DriverDB" %>
<%@ page import = "syh.mdao.Mdao" %>
<%	
	String send_id = request.getParameter("send_id");
	Mdao mdao = new Mdao();
	mdao.uDelete(send_id);
	
	response.sendRedirect(request.getContextPath() + "/userlist/user_list.jsp");
%>