<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("userObject") == null) {
    	response.sendRedirect("user_login.jsp");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.db.DBConnect" %>
<%@page import="com.entity.Appointment" %>
<%@page import="com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointment</title>
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
		response.sendRedirect("user_login.jsp");
	%>

	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fulid bgImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Your Appointments</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Doctor</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Appointment Time</th>
									<!-- <th scope="col">Email</th>
									<th scope="col">Mob No</th> -->
									<th scope="col">Disease</th>
									<th scope="col">Response</th>
								</tr>
							</thead>
							<tbody>
								<%
								
									User userObj = (User) request.getSession().getAttribute("userObject");
									int userId = userObj.getId();
									String st = "Select * FROM appointment WHERE user_id = " + userId ;
									PreparedStatement ps = DBConnect.getConn().prepareStatement(st);
									ResultSet rs = ps.executeQuery();
									while(rs.next()) {
										/* System.out.println(d.getId); */
								%>
								<tr>
									<% if(rs.getString(13)== null) { %>
										<td class="p-1">
											<p class="fs-7 text-danger">Sorry ! Our doctors are not available at this date and time</p>
											<p class="fs-7 text-danger">Please make another appointment with different time and date</p>
										</td>
									<% } else { %>
										<td><%=rs.getString(13)%></td>
									<% } %>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(14)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(9)%></td>
									<td>
									
									<% if(rs.getString(13)== null) { %>
											<a href="makeNewAppointment?id=<%=rs.getString(1)%>" class="btn btn-danger">make new appointment</a>
									<% 	} else if("Pending".equals(rs.getString(12))){ %>
											<a href="#" class = "btn btn-warning disabled">Pending</a>	
									<% } else { %>
											<p class="text-success">Accepted</p>
											<p><%= rs.getString(12)%></p>
											<a href="video/video.jsp?id=<%=rs.getString(1)%>" class = "btn btn-success">Start Conversation</a>
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