<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
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
	</div>
	
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Appointments</p>
						<table class="table">
							<thead>
								<tr>
									<!-- <th scope="col">Doctor Name</th> -->
									
									<th scope="col">Patient Name</th>
									
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Prefered Time</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Disease</th>
									<th scope="col">Action</th>
									<th scope="col">Enter time</th>
									
								</tr>
							</thead>
							<tbody>
							
								<%
								
								AppointmentDao sp = new AppointmentDao(DBConnect.getConn());
								Doctor doc = (Doctor) session.getAttribute("doctorObject");
								List<Appointment> list = sp.getAllAppointmentsByLoginDoctor( doc );
								
								for (Appointment a : list) {
									/* System.out.println(d.getId); */
									
								%>
								<tr>
									<%-- <td><%=d.getId()%></td> --%>
									<%-- <td><%=${doc_name}%></td> --%>
									<td><%=a.getFullName()%></td>
									<td><%=a.getGender()%></td>
									<td><%=a.getAge()%></td>
									<td><%=a.getAppoinTime()%></td>
									<td><%=a.getEmail()%></td>
									<td><%=a.getPhNo()%></td>
									<td><%=a.getDiseases()%></td>
									<td>
										  
										<button type="button" class="openInputBtn1 btn btn-success" name = "comment" >Comment</button>
												
									</td>
									<td>
										<div class="d-flex justify-content-center mb-4">
										    
										        <input type="text"  class="form-control w-50" placeholder = "enter timings"/>
										    
										    <button type="button" class="btn btn-secondary btn-sml">Submit</button>
										</div>
									</td>
								</tr>	
								<%
									}
								%>
								
							
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>	
	
	
	
	
	
	
</body>
</html>