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
	</div>
	
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Appointments</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty rejectMsg}">
							<div class="fs-5 text-center text-danger" role="alert">${rejectMsg}</div>
							<c:remove var="rejectMsg" scope="session" />
						</c:if>
						<c:if test="${not empty p_succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${p_succMsg}</div>
							<c:remove var="p_succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty p_errorMsg}">
							<div class="fs-3 text-center text-danger" role="alert">${p_errorMsg}</div>
							<c:remove var="p_errorMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<!-- <th scope="col">Doctor Name</th> -->
									
									<th scope="col">Patient Name</th>
									
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Selected Date</th>
									<th scope="col">Prefered Time</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Disease</th>
									<th scope="col">Action</th>
									
								</tr>
							</thead>
							<tbody>
							
								<%
								
								AppointmentDao sp = new AppointmentDao(DBConnect.getConn());
								Doctor doc = (Doctor) session.getAttribute("doctorObject");
								List<Appointment> list = sp.getAllAppointmentsByLoginDoctor( doc );
								
								for (Appointment a : list) {
									 int uid = sp.getUserIdForPrescription(a.getId());
									 /* System.out.println("inside jsp : " + uid + " and " + a.getId()); */
									
								%>
								<tr>
									
									<td><%=a.getFullName()%></td>
									<td><%=a.getGender()%></td>
									<td><%=a.getAge()%></td>
									<td><%=a.getDate()%></td>
									<td><%=a.getAppoinTime()%></td>
									<td><%=a.getEmail()%></td>
									<td><%=a.getPhNo()%></td>
									<td><%=a.getDiseases()%></td>
									<td>
									
									<% if("Pending".equals(a.getStatus())) { %>
										<form action="../rejectPatient" method="post">
											<a href="comment.jsp?id=<%=a.getId()%>" class = "btn btn-success">Accept</a>
											<button type="submit" class="btn btn-danger">Reject</button>
											<input type="hidden" name="appId" value="<%=a.getId()%>">
											<input type="hidden" name="specialist" value="<%=a.getSpId()%>">
											<input type="hidden" name="doc_name" value="${doctorObject.fullName}">
											<%-- <% System.out.println("printing from jsp file : ${doctorObject.fullName}""); %> --%>
										</form>
											
									<% 	} else { %>
											<a href="../video/video.jsp?id=<%=a.getId()%>" class = "btn btn-success">Start Conversation</a>
											<a href="prescribe.jsp?id=<%=a.getId()%>&uid=<%=uid%>" class = "btn btn-primary">Prescribe</a>
									<% } %>

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