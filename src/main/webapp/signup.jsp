<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Register</title>
<%@include file="components/common_css.jsp" %>

</head>

<body style="background-color : #F5F5F5">

	<%
		if(session.getAttribute("doctorObject")!=null) {
			response.sendRedirect("doctor/index.jsp");
		} if ( session.getAttribute("adminObject")!=null ) {
			response.sendRedirect("admin/index.jsp");
		} if ( session.getAttribute("userObject")!=null ) {
			response.sendRedirect("index.jsp");
		}
	%>

	<%@include file="components/navbar.jsp" %>
	<br><br>
	
		<section class="vh-100 t-5" >
		  <div class="container ">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		      <div class="col-lg-12 col-xl-11">
		        <div class="card text-black" style="border-radius: 25px;">
		          <div class="card-body p-md-5">
		            <div class="row justify-content-center">
		              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
		
		                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>
		                
		                <c:if test="${not empty successMsg }">
		                	<p class = "text-center text-success fs-3">${successMsg}</p>
		                	<c:remove var="successMsg" scope="session"/> 
		                </c:if>
		                
		                <c:if test="${not empty passwordMsg }">
		                	<p class = "text-center text-danger fs-5">${passwordMsg}</p>
		                	<c:remove var="passwordMsg" scope="session"/> 
		                </c:if>
		                
		                <c:if test="${not empty errorMsg }">
		                	<p class = "text-center text-danger fs-3">${errorMsg}</p>
		                	<c:remove var="errorMsg" scope="session"/>
		                </c:if>
		                
		                <!-- ============================================================ -->
		                <!-- ======================= FORM ============================== -->
		                <!-- ============================================================ -->
		
		                <form action="user_register" class="mx-1 mx-md-4" method="post">
		                
		                <!-- ======================= Name ============================== -->
		
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-person fa-2xl me-2 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="text" id="form3Example1c" class="form-control" name="fullName" />
		                      <label class="form-label" for="form3Example1c">Your Name</label>   <!-- shows error in "for" -->
		                    </div>
		                  </div>
		                  
		                  <!-- ======================= E-mail ============================== -->
		
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="email" id="form3Example3c" class="form-control" name="email" />
		                      <label class="form-label" for="form3Example3c">Your Email</label>
		                    </div>
		                  </div>
		                  
		                  <!-- ======================= Age - Drop down ============================== -->
		                  
		                  <!-- <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		
				                <select class="select form-select">
				                  <option value="1" disabled>Age Groups</option>
				                  <option value="2">0 - 5</option>
				                  <option value="3">6 - 10</option>
				                  <option value="4">11 - 17</option>
				                  <option value="4">18 - 25</option>
				                  <option value="4">26 - 40</option>
				                  <option value="4">41 - 55</option>
				                  <option value="4">56 - 74</option>
				                  <option value="4">75 and above</option>
				                </select>
				                <label class="form-label" for="form3Example3c">Age</label>
		
		              		</div>
		                  </div> -->
		                  
		                  <!-- ======================= Password ============================== -->
		
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="password" id="form3Example4c" class="form-control" name="password" />
		                      <label class="form-label" for="form3Example4c">Password</label>
		                    </div>
		                  </div>
		
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="password" id="form3Example4cd" class="form-control" name="Rpassword"/>
		                      <label class="form-label" for="form3Example4cd">Repeat your password</label>
		                    </div>
		                  </div>
		                  
		                  <!-- ======================= Extra Stuff ============================== -->
		
		                  <div class="form-check d-flex justify-content-center mb-5">
		                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" />
		                    <label class="form-check-label" for="form2Example3">
		                      I agree all statements in <a href="#!">Terms of service</a>
		                    </label>
		                  </div>
		
		                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
		                    <button type="submit" class="btn btn-primary btn-lg">Register</button>
		                  </div>
		                  
		                  <p class="mb-5 pb-lg-2 justify-content-center" style="color: #393f81;">Already have an account? <a href="user_login.jsp"
		                      style="color: #393f81; text-decoration:none">Login here</a></p>
		
		                </form>
		                
		                
		
		              </div>
		              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
		
		                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
		                  class="img-fluid" alt="Sample image">
		
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  <br><br><br>
		  
		  <%@include file="components/footer.jsp" %>
		</section>
  

  	


</body>
</html>