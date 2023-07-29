<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
	
	<div class="row t-5 m-auto">
	
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-user-doctor fa-2xl"></i><hr>
	        <h5 class="card-title">Doctors</h5>
	        <p class="card-text">42</p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-user fa-2xl"></i><hr>
	        <h5 class="card-title">Users</h5>
	        <p class="card-text">169</p>
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
	        <h5 class="card-title">Total Appointments</h5>
	        <p class="card-text">29</p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-md-5 mx-auto">
	    <div class="card paint-card p-5">
	      <div class="card-body text-center">
	      	<i class="fa-solid fa-calendar-check fa-2xl"></i><hr>
	        <h5 class="card-title">Specialists</h5>
	        <p class="card-text">29</p>
	      </div>
	    </div>
	  </div>
	  
	</div>
	
	<br><br><br>
	
	<%@include file="../components/footer.jsp" %>
	

</body>
</html>