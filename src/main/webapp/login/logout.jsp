<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	session.invalidate(); // ���� ����
%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type = "text/javascript">
	alert('�α׾ƿ�');
	location.href='<%= request.getContextPath()%>/index.jsp';

</script>
</body>
</html>