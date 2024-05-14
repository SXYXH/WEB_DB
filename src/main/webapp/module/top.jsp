<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
String S_NAME = (String)session.getAttribute("S_NAME");
%>
 <!-- Begin Wrapper -->
 	<div id="wrapper">
   
         <!-- Begin Header -->
		<div id="header">
		/module/top.jsp	<br>
		
<%
if (S_LEVEL == null){
%>
	<!--  1-1 로그인 전화면 시작 -->   
	<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01회원가입</a>
	<form action ="<%= request.getContextPath() %>/login/login_action.jsp" method="post">
		아이디 : <input type="text" name="uid">
		비번 : <input type="password" name="upw"> 
		<input type="submit" value="로그인버튼">
	</form>
		<!--  1-1 로그인 전화면 끝 -->
<%
}else{
	if(S_LEVEL.equals("구매자")){
%>
	<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01회원가입</a>					 
	<a href="#">04상품검색</a>
<% 
	}else if(S_LEVEL.equals("판매자")){
%>
	<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01회원가입</a>	 
	<a href="#">03상품등록</a>					 
	<a href="#">04상품검색</a>
<%
	}else if(S_LEVEL.equals("관리자")){
%>
	<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01회원가입</a>
	<a href="<%= request.getContextPath() %>/userlist/user_list.jsp">02회원검색</a>
	<a href="#">03상품등록</a>					 
	<a href="#">04상품검색</a>
<%
}
%>
	<!-- 1-2 로그인후 화면 시작 -->
	<br>
	
		<%= S_NAME %> 님 <%= S_LEVEL %>권한으로 로그인중
	<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>	
<%} %>
	<!-- 1-2 로그인후 화면 끝 -->
						 
		</div>
		 <!-- End Header -->

