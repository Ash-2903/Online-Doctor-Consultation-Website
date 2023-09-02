<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("adminObject") == null) {
        response.sendRedirect("../admin_login.jsp");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@page import="com.db.DBConnect" %>
<%@page import="com.dao.DoctorDao" %>
<%@page import="com.dao.AppointmentDao" %>
<%@page import="com.dao.UserDao" %>
<%@page import="com.dao.SpecialistDao" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin's Dashboard</title>
<%@include file="../components/common_css.jsp" %>

<style>
	.paint-card {
		box-shadow : 0 0 4px 0 rgba(0, 0, 0.3);
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

	
	<h1 class="text-center p-5">Admin's Dashboard</h1>
	
	<c:if test="${not empty succMsg }">
		     <p class = " small text-center text-success fs-5">${succMsg}</p>
		     <c:remove var="succMsg" scope="session"/>
	</c:if>
		                
	<c:if test="${not empty errorMsg }">
		      <p class = " small text-center text-danger fs-5">${errorMsg}</p>
		      <c:remove var="errorMsg" scope="session"/>
	</c:if>
	
	<div class="row t-5 m-auto">
	
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-user-doctor fa-2xl"></i><hr>
	        <h5 class="card-title">Doctors</h5>
	        <%
	        	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	        %>
	        <p class="card-text"><%= dao.countDocs() %></p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-user fa-2xl"></i><hr>
	      	<%
	      		UserDao uDao = new UserDao(DBConnect.getConn());
	      	%>
	        <h5 class="card-title">Users</h5>
	        <p class="card-text"><%= uDao.countUsers() %></p>
	      </div>
	    </div>
	  </div>
	 </div>
	  
	  <br><br>
	  
	 <div class="row t-5 m-auto">
	  
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-regular fa-calendar-check fa-2xl"></i><hr>
	      	<%
	      	AppointmentDao aDao = new AppointmentDao(DBConnect.getConn());
	      	%>
	        <h5 class="card-title">Total Appointments</h5>
	        <p class="card-text"><%= aDao.countAppointments() %></p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-calendar-check fa-2xl"></i><hr>
	      	<%
	      		SpecialistDao sDao = new SpecialistDao(DBConnect.getConn());
	      	%>
	        <h5 class="card-title">Specialists</h5>
	        <p class="card-text"><%= sDao.countSpecialist() %></p>
	      </div>
	    </div>
	  </div>
	  
	</div>
	
	<br><br><br>


	<!-- Specialist Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New Specialist</h5>
	        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="../addSpecialist" method="post">
	        	<div class="form-group">
	        		<label class="mb-2">Enter Specialist Name</label>
	        		<input type="text" class="form-control" name="spName">
	        	</div>
	        	<div class="text-center mt-3">
	        		<button type="submit" class="btn btn-primary">Submit</button>
	        	</div>
	        	
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<%@include file="../components/footer.jsp" %>
	

</body>
</html>