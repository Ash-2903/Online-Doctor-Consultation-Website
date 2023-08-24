<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Doctors</title>
<%@include file="components/common_css.jsp"%>
<style type="text/css">
	.paint-card {
		box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	}
	.rating {
	        display: inline-block;
	        direction: rtl; /* Set the text direction to right-to-left */
	    }
	
	    /* Hide the radio inputs */
	    .rating input[type="radio"] {
	        display: none;
	    }
	
	    /* Style for the star icons */
	    .rating label {
	        font-size: 1rem;
	        color: #ccc;
	        cursor: pointer;
	    }
	
	    /* Style for selected star icons */
	    .rating input[type="radio"]:checked ~ label {
	        color: #f39c12;
	    }
</style>
</head>
<body style="background-color : #F5F5F5">	


	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("userObject")==null)
		response.sendRedirect("user_login.jsp");
	%>

	<%@include file="components/navbar.jsp"%>
	
	
	<!-- <div class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Modal body text goes here.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">Save changes</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div> -->
	
	
	
	
	
	
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
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
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Rating</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Doctor> list2 = dao2.getAllDocs();
								for (Doctor d : list2) {
									/* System.out.println(d.getId); */
									
								%>
								<tr>
									<%-- <td><%=d.getId()%></td> --%>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialization()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getPhno()%></td>
									
									<td>
										
										<form action="sumbitResponse" method="post">
										
											<input type="hidden" name="userId" value="${userObject.id}">
											<input type="hidden" name="docId" value="<%=d.getFullName()%>">
											
											 <div id="rating<%=d.getId()%>" class="rating">
							                    <input type="radio" id="star5_<%=d.getId()%>" name="rating" value="5">
							                    <label for="star5_<%=d.getId()%>"><i class="fas fa-star"></i></label>
							                    
							                    <input type="radio" id="star4_<%=d.getId() %>" name="rating" value="4">
							                    <label for="star4_<%=d.getId()%>"><i class="fas fa-star"></i></label>
							                    
							                    <input type="radio" id="star3_<%=d.getId() %>" name="rating" value="3">
							                    <label for="star3_<%=d.getId()%>"><i class="fas fa-star"></i></label>
							                    
							                    <input type="radio" id="star2_<%=d.getId() %>" name="rating" value="2">
							                    <label for="star2_<%=d.getId()%>"><i class="fas fa-star"></i></label>
							                    
							                    <input type="radio" id="star1_<%=d.getId() %>" name="rating" value="1">
							                    <label for="star1_<%=d.getId()%>"><i class="fas fa-star"></i></label>
							                </div>
							                
											<%-- <%@include file="components/rating.jsp" %> --%>
											<!-- <select class="form-control input-group mx-auto" name="rating" required>
												<option value="">rate</option>
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>
											</select> -->
											<!-- <button type="submit" class="btn btn-primary">Submit</button> -->
											<button type="submit" class="btn"><i class="fa-solid fa-check" style="color: #050505;"></i></button>
										</form>
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