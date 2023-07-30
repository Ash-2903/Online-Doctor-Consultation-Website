<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>

<link rel="stylesheet" href="css/styles.css">

<header data-bs-theme="dark">
  <nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp">
    		<i class="fa-solid fa-user-doctor fa-beat"></i>
    		Cure Quest
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    

    <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
    
    <c:if test="${empty userObject }">
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
      		<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="admin_login.jsp">ADMIN</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="doctor_login.jsp">DOCTOR</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">APPOINTMENT</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="user_login.jsp">USER</a>
		        </li>
			</ul>
    	</div>
    	
    </c:if>
    
    <c:if test = "${not empty userObject }">
    
  
    
    	<div class="collapse navbar-collapse" id="navbarSupportedContent">
      		<ul class="navbar-nav md-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">APPOINTMENT</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">VIEW APPOINTMENTS</a>
		        </li>
		        </ul>
    	
    
		        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:black; hover:blue;">
			          	<i class="fa-solid fa-circle-user fa-lg"></i>
			            ${userObject.fullName}
			          </a>
			          <ul class="dropdown-menu">
			          	<li><a class="dropdown-item" href="#">Reset Password</a></li>
			          	
			            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
			            
			          </ul>
			        </li>
       			</ul>
       		</div>
       
			
    	</c:if>
    

  </div>
</nav>
</header>

<style>

	.navbar {
		background-color: #B0DAFF;
	}

</style>

