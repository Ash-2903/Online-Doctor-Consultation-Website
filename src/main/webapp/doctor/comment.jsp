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
<%@page import="com.entity.Appointment" %>
<%@page import="com.dao.AppointmentDao" %>
<%@page import="java.util.List" %>
<%@page import="com.entity.Doctor" %>
<%@page import="com.dao.SpecialistDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Information</title>

<style>
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
						<p class="text-center fs-4">Patient Comment</p>
	
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							System.out.println(id);
							AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
	
							Appointment ap = dao.getAppointmentById(id);
							if(ap==null)
								out.println("ap is null ohhnoooo");
						%>
	
						<form class="row" action="../updateStatus" method="post" >

							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=ap.getFullName()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Email</label> <input type="text" value="<%=ap.getEmail()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Mob No</label> <input type="text" readonly
									value="<%=ap.getPhNo()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Diseases</label> <input type="text" readonly
									value="<%=ap.getDiseases()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control"
									cols="4"></textarea>
							</div>

							<input type="hidden" name="id" value="<%= ap.getId()%>"> 
							<input type="hidden" name="did" value="<%= ap.getDoctor() %>">

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div><br><br>
	
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-9 text-center mx-auto">
			<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">The patient's Appointments History</p>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Doctor</th>
									<th scope="col">Specialization</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Disease</th>
								</tr>
							</thead>
							<tbody>
						<%
							List<Appointment> list = dao.getAllOldAppointmentsById(ap.getUserId());
							SpecialistDao spDao = new SpecialistDao(DBConnect.getConn());
							for (Appointment a : list) {
						%>
						
							<tr>
								<td><%= a.getDoctor() %></td>
								<td><%= spDao.getSpById(a.getSpId()) %></td>
								<td><%= a.getFullName() %></td>
								<td><%= a.getGender() %></td>
								<td><%= a.getAge() %></td>
								<td><%= a.getDate() %></td>
								<td><%= a.getDiseases() %></td>
								
							</tr>
						
						
						<%} %>
						</tbody>
						</table>

			</div>
		</div>
		</div>
		</div>
		</div><br><br><br><br>
</body>
</html>