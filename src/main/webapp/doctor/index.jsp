<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../components/common_css.jsp" %>
</head>
<body>

	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("doctorObject")==null)
		response.sendRedirect("../doctor_login.jsp");
	%>

	<%@include file="navbar.jsp" %>
	<h1>Doctor's Dashboard</h1>

</body>
</html>