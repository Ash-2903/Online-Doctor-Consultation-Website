<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored = "false" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.db.DBConnect" %>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Prescription"%>
<%@page import="com.entity.Appointment" %>
<%@page import="com.dao.AppointmentDao" %>
<%@page import="com.dao.PrescrptionDao" %>
<%@page import="com.dao.SpecialistDao" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointments</title>
<style>
	.paint-card {
		box-shadow : 0 0 2px 0 rgba(0, 0, 0.3);
	}
	.bgImg {
		background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url("images/apmt_bg.jpg");
		height : 20vh;
		width: 100%;
		bachground-size: cover;
		background-repeat: no-repeat;
	}
</style>
<%@include file="components/common_css.jsp"%>
</head>

<body style="background-color : #F5F5F5">

	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("userObject")==null)
		response.sendRedirect("../user_login.jsp");
	%>

	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fulid bgImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	
	<h1 class="text-center p-5">Your Prescription</h1>
	
	<%
		PrescrptionDao pd = new PrescrptionDao(DBConnect.getConn());
		AppointmentDao apDao = new AppointmentDao(DBConnect.getConn());
		SpecialistDao spDao = new SpecialistDao(DBConnect.getConn());
		User u = (User) request.getSession().getAttribute("userObject");
		int u_id = u.getId();
		List<Prescription> list = pd.getAllPrsByUserId(u_id);
		for(Prescription p : list) {
			Appointment ap = apDao.getAppointmentByIdDb2(p.getaId());
			String sp_name = spDao.getSpById(ap.getSpId());
	%>
	
		<div class="col-md-5 mx-auto mb-4">
	    <div class="card paint-card">
	      <div class="card-body">
	      	<h5 class="card-title text-center p-3">Doctor : <%= ap.getDoctor() %> ( <%= sp_name %> )</h5><hr>
	        <p class="card-text"><strong>Date : </strong><%= ap.getDate() %></p>
	        <p><strong>Time of Appointment : </strong><%= ap.getAppoinTime() %></p>
	        <p><strong>Illness : </strong><%= ap.getDiseases() %></p><br>
	        <p class="text-center"><strong>ADVICE :</strong></p>
	        <p class="text-center"><%= p.getPrescribe() %></p>
	      </div>
	    </div>
	  </div>

	<% } %>

</body>
</html>