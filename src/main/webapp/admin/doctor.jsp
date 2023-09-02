<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("adminObject") == null) {
        response.sendRedirect("../admin_login.jsp");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctors Details</title>
<%@include file="../components/common_css.jsp" %>
<style>
	.paint-card {
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
</style>
</head>
<body style="background-color : #F5F5F5">

	<%@include file="navbar.jsp" %>	
	
	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("adminObject")==null)
		response.sendRedirect("../admin_login.jsp");
	%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg }">
							<p class="fs-5 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="fs-5 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" required name = "fullName" class="form-control"/>
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" required name = "dob" class="form-control"/>
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" required name = "qual" class="form-control"/>
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option>--select--</option>
									<% 
										SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
										List<Specialist> list = dao.getAllSpecialist();
										for(Specialist s:list)  {
									%>
										<option><%= s.getSpecialistName() %> </option>
									<%}
									%>
									
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="text" required name = "email" class="form-control"/>
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label>
								<input type="text" required name = "phno" class="form-control"/>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="password" required name = "password" class="form-control"/>
							</div>
							<div class="mb-3 text-center">
								<button class="btn btn-primary" type="submit">
									Submit
								</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Date of Birth</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialisation</th>
									<th scope="col">Email</th>
									<th scope="col">Phone number</th>
								</tr>
							</thead>
							<tbody>
								<%
									DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
									List<Doctor> list2 = dao2.getAllDocs();
									
									for(Doctor d : list2) {
										
								%>
								<tr>
									<td><%= d.getFullName() %></td>
									<td><%= d.getDob() %></td>
									<td><%= d.getQualification() %></td>
									<td><%= d.getSpecialization() %></td>
									<td><%= d.getEmail() %></td>
									<td><%= d.getPhno() %></td>
								</tr>	
								<% } %>
							
							
							</tbody>
							
						</table>
					</div>
				</div>
			</div>
			
		</div>
	</div> 
	
	<%@include file="../components/footer.jsp" %>	

</body>
</html>