<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Page</title>
<%@include file="components/common_css.jsp" %>

<style>
	
		.divider:after,
		.divider:before {
			content: "";
			flex: 1;
			height: 1px;
			background: #eee;
		}
		
	
</style>

</head>

	<%
		if(session.getAttribute("doctorObject")!=null) {
			response.sendRedirect("doctor/index.jsp");
		} if ( session.getAttribute("adminObject")!=null ) {
			response.sendRedirect("admin/index.jsp");
		} if ( session.getAttribute("userObject")!=null ) {
			response.sendRedirect("index.jsp");
		}
	%>

<body style="background-color : #F5F5F5">
	<%@include file="components/navbar.jsp" %>

	
	
	
	<section class="vh-100" >
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col col-xl-10">
	        <div class="card" style="border-radius: 1rem;">
	          <div class="row g-0">
	            <div class="col-md-6 col-lg-5 d-none d-md-block">
	              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
	                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
	            </div>
	            <div class="col-md-6 col-lg-7 d-flex align-items-center">
	              <div class="card-body p-4 p-lg-5 text-black">
	              
	              <!-- ================================= FORM ============================================ -->
	
	                <form method="post" action="adminLogin">
	
	                  <div class="d-flex align-items-center mb-3 pb-1">
	                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
	                    <span class="h1 fw-bold mb-0">Admin Login</span>
	                  </div>
	
	                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
	                  
	                  <c:if test="${not empty succMsg }">
		                	<p class = " small text-center text-success fs-5">${succMsg}</p>
		                	<c:remove var="succMsg" scope="session"/>
		               </c:if>
		                
		               <c:if test="${not empty errorMsg }">
		                	<p class = " small text-center text-danger fs-5">${errorMsg}</p>
		                	<c:remove var="errorMsg" scope="session"/>
		               </c:if>
	                  
	                  <!-- ================================= E-MAIL ============================================ -->
	
	                  <div class="form-outline mb-4">
	                    <input type="email"  name = "email" class="form-control form-control-lg" />
	                    <label class="form-label">Email address</label>
	                  </div>
	                  
	                  <!-- ================================= PASSWORD ============================================ -->
	
	                  <div class="form-outline mb-4">
	                    <input type="password" name="password" class="form-control form-control-lg" />
	                    <label class="form-label" >Password</label>
	                  </div>
	                  
	                  <!-- ================================= BUTTON ============================================ -->
	
	                  <div class="pt-1 mb-4">
	                    <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
	                  </div>
	
	                  <!-- <a class="small text-muted" style="text-decoration: none" href="#!">Forgot password?</a>
	                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="#!"
	                      style="color: #393f81;">Register here</a></p> -->
	                  <a href="#!" class="small text-muted">Terms of use.</a>
	                  <a href="#!" class="small text-muted">Privacy policy</a>
	                  
	                </form>
	
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <br><br><br><br>
  
  <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between ">
	  	 	<%@include file="components/footer.jsp" %>
</div>
</section>
  
   
  
  


  		
  		




</body>
</html>