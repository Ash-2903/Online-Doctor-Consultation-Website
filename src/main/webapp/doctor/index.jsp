<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    Doctor d = (Doctor) session.getAttribute("doctorObject");
    if (d == null) {
        response.sendRedirect("../doctor_login.jsp");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@page import="com.db.DBConnect" %>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao" %>
<%@page import="com.dao.AppointmentDao" %>

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
	      	<%
	        	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	        %>
	        <h5 class="card-title">Doctor</h5>
	        <p class="card-text"><%= dao.countDocs() %></p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-user fa-2xl"></i><hr>
	      	<%-- <%
	      		Doctor d = (Doctor) session.getAttribute("doctorObject");
		      	if (d == null) {
		            response.sendRedirect("../doctor_login.jsp");
		        } else {
		            AppointmentDao aDao = new AppointmentDao(DBConnect.getConn());
	        %> --%>
	        <% AppointmentDao aDao = new AppointmentDao(DBConnect.getConn()); %>
	        <h5 class="card-title">Appointments</h5>
	        <p class="card-text"><%= aDao.countAppointmentsByDocId(d.getFullName()) %></p>
	        <%-- <% } %> --%>
	      </div>
	    </div>
	  </div>
	  
	 </div>
	
	
	
	
	
</body>
</html>

<%-- <% } %> --%>