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
<%@ page isELIgnored = "false" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.db.DBConnect" %>
<%@page import="com.entity.Appointment" %>
<%@page import="com.entity.User" %>
<%@page import="com.entity.Doctor" %>
<%@page import="com.dao.DoctorDao" %>
<%@page import="com.dao.AppointmentDao" %>
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

	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("doctorObject")==null)
		response.sendRedirect("../doctor_login.jsp");
	%>

	<%@include file="navbar.jsp" %>
	
	<div class="container-fulid bgImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div><br><br>
	
	
	
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Presrcibtion</p>
	
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							/* System.out.println(id); */
							AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
	
							Appointment ap = dao.getAppointmentById(id);
							if(ap==null)
								System.out.println("ap is null ohhnoooo");
						%>
	
						<form class="row" action="../sendPrescription" method="post" >

							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=ap.getFullName()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Diseases</label> <input type="text" readonly
									value="<%=ap.getDiseases()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Enter the Prescription</label>
								<textarea rows="7" cols="7" required name="pres_msg" class="form-control"
									cols="4"></textarea>
							</div>

							<input type="hidden" name="uid" value="<%= ap.getUserId()%>"> 
							<input type="hidden" name="id" value="<%= ap.getId() %>">
							<% System.out.println(ap.getId()); %>

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	

</body>
</html>