<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
    if (session.getAttribute("userObject") == null) {
        response.sendRedirect("../user_login.jsp");
        return;
    }
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.*"%>
<%@page import = "java.time.format.DateTimeFormatter" %>
<%@page import = "java.time.LocalDateTime" %>
<%@page import = "java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Make Appointments</title>
<%@include file="components/common_css.jsp" %>
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
</head>
<body style="background-color : #F5F5F5">	

	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fulid bgImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="text-center container p-3 mt-5 mb-5">
		<div class="row">
			

			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<h5 class="text-center fs-3 p-4">User Appointment</h5>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form class="row g-3" action="addAppointment" method="post">

							<input type="hidden" name="userid" value="${userObject.id}">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> 
								<input placeholder="Full Name" required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6 ">
								<label class="form-label">Gender</label> <select class="form-control" name="gender"
									required>
									<option value="">--select--</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
									<option value="female">Others</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									placeholder="age" required type="number" class="form-control" name="age">
							</div>

							

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									placeholder="youremail@email.com" required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									placeholder="1234567890" maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>
							
							
							<div class="col-md-6">
								<label class="form-label">Date</label> <select
									required class="form-control" name="date">
									<option value="">--select--</option>
									<%
										  java.time.LocalDate currentDate = java.time.LocalDate.now();
										  java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy");
										  
											for (int i = 0; i < 4; i++) { 
										  
										    java.time.LocalDate date = currentDate.plusDays(i);
										    String formattedDate = date.format(formatter);
										  %>
										  <option value="<%= formattedDate %>"><%= formattedDate %></option>
										<% } %>
								</select>
							</div>
							
							
							<div class="col-md-6">
								<label class="form-label">Appointment
									Time</label> <select
									required class="form-control" name="time">
									<option value="">--select--</option>
									<option value="8 AM - 10 AM">8 AM - 10 AM</option>
									<option value="10 AM - 12 PM">10 AM - 12 PM</option>
									<option value="12 PM - 3 PM">12 PM - 3 PM</option>
									<option value="3 PM - 5 PM">3 PM - 5 PM</option>
									<option value="5 PM - 6 PM">5 PM - 6 PM</option>
									<option value="7 PM - 9 PM">7 PM - 9 PM</option>
									<option value="9 PM - 12 AM">9 PM - 12 AM</option>
									<option value="Any time of the day">Any time of the day</option>
									</select>
							</div>
							


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									placeholder="Describe your sickness" required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="specialist">
									<option value="">--select--</option>

									<% 
										SpecialistDao sp = new SpecialistDao(DBConnect.getConn());
										List<Specialist> list = sp.getAllSpecialist();
										for(Specialist s:list)  {
									%>
									<option value="<%=s.getId()%>"><%= s.getSpecialistName() %> </option>
									
									<%
									}
									%>

								</select>
							</div>


							<div class="col-sm-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObject }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-primary">Submit</a>
							</c:if>

							<c:if test="${not empty userObject }">
								<button type="submit" class="col-md-6 offset-md-3 btn btn-primary">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="p-5">
					<div class="card paint-card" style="width: 18rem;">
					  <div class="card-body">
					    <h5 class="card-title">Patient Reviews</h5>
					    <h6 class="card-subtitle mb-2 text-muted">We take patient feedback seriously.</h6>
					    <p class="card-text">The recommendation system considers positive patient reviews and testimonials to guide you toward doctors who consistently deliver exceptional care.</p>
					  </div>
					 </div>
				 </div>
				 <div class="p-5">
					 <div class="card paint-card" style="width: 18rem;">
					  <div class="card-body">
					    <h5 class="card-title">Continuous Improvement</h5>
					    <h6 class="card-subtitle mb-2 text-muted">Recommending best doctor</h6>
					    <p class="card-text">Our recommendation system evolves with time, incorporating user feedback and data to refine the matching process and enhance your experience.</p>
					  </div>
					 </div>
				 </div> 
			</div>
			
		</div>

	</div>
	<%@include file="components/footer.jsp"%>

</body>
</html>