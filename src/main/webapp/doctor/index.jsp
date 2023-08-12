<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
	.paint-card {
		box-shadow : 0 0 2px 0 rgba(0, 0, 0.3);
	}
	.bgImg {
		background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url("../images/apmt_bg.jpg");
		height : 20vh;
		width: 100%;
		bachground-size: cover;
		background-repeat: no-repeat;
	}
</style>
<%@include file="../components/common_css.jsp"%>
</head>

<body style="background-color : #F5F5F5">

	<%@include file="navbar.jsp" %>
	
	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("doctorObject")==null)
		response.sendRedirect("../doctor_login.jsp");
	%>

	
	<h1 class="text-center p-5">Doctor's Dashboard</h1>
	
	<div class="row t-5 m-auto">
	
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-user-doctor fa-2xl"></i><hr>
	        <h5 class="card-title">Doctor</h5>
	        <p class="card-text">42</p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-user fa-2xl"></i><hr>
	        <h5 class="card-title">Appointments</h5>
	        <p class="card-text">169</p>
	      </div>
	    </div>
	  </div>
	  
	 </div>
	
	
	
	
	
</body>
</html>