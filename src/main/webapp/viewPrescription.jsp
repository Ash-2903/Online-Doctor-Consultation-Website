<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("userObject") == null) {
        response.sendRedirect("user_login.jsp");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored = "false"%>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.db.DBConnect" %>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Prescription"%>
<%@page import="com.entity.Appointment" %>
<%@page import="com.dao.AppointmentDao" %>
<%@page import="com.dao.PrescrptionDao" %>
<%@page import="com.dao.SpecialistDao" %>
<%@page import="com.dao.DoctorDao" %>
<%@page import="com.dao.RatingDao" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointments</title>
<%@include file="components/common_css.jsp"%>
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
		response.sendRedirect("../user_login.jsp");
	%>

	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fulid bgImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<h1 class="text-center p-5">Your Prescriptions</h1>
	
	<c:if test="${not empty errorMsg}">
		<p class="fs-3 text-center text-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session" />
	</c:if>
	<c:if test="${not empty succMsg}">
		<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<%
	
		PrescrptionDao pd = new PrescrptionDao(DBConnect.getConn());
		AppointmentDao apDao = new AppointmentDao(DBConnect.getConn());
		SpecialistDao spDao = new SpecialistDao(DBConnect.getConn());
		DoctorDao dDao = new DoctorDao(DBConnect.getConn());
		
		User u = (User) request.getSession().getAttribute("userObject");
		int u_id = u.getId();
		
		List<Prescription> list = pd.getAllPrsByUserId(u_id);
		
		for(Prescription p : list) {
			Appointment ap = apDao.getAppointmentByIdDb2(p.getaId());
			if(ap != null) {
			System.out.println(p.getaId());
			String sp_name = spDao.getSpById(ap.getSpId());
			int d_id = dDao.getDoctorIdByName(ap.getDoctor());
			// System.out.println("user : " + u.getId() + " doctor : " + ap.getDoctor() + " d_id : " + d_id);
			
	%>
	
	  <div class="col-md-5 mx-auto mb-5">
	  
	    <div class="card paint-card">
	      <div class="card-body">
	      	<h5 class="card-title text-center p-3" style="color:#1D5D9B">Doctor : <%= ap.getDoctor() %> ( <%= sp_name %> )</h5><hr>
	        <p class="card-text"><strong>Date : </strong><%= ap.getDate() %></p>
	        <p><strong>Time of Appointment : </strong><%= ap.getAppoinTime()%></p>
	        <p><strong>Illness : </strong><%= ap.getDiseases() %></p><br>
	        <p class="text-center"><strong>ADVICE :</strong></p>
	        <p class="text-center"><%= p.getPrescribe() %></p>
	      </div>
	    </div>
	    
	    <form class = "text-center" action="sumbitResponse" method="post">
	    
			<input type="hidden" name="userId" value="${userObject.id}">
			<input type="hidden" name="docId" value="<%=ap.getDoctor()%>">
			
			
			
			<%
				RatingDao rdao = new RatingDao(DBConnect.getConn());
				boolean flag = rdao.checkRating(ap.getUserId(), ap.getDoctor());
				/* System.out.println("bool value from jsp : " + flag); */
				if(!flag) {
			
			%>
			
			<label>Rate you doctor : </label>
												
			<div id="rating<%=d_id%>" class="rating">
			
				<input type="radio" id="star5_<%=d_id%>_<%=ap.getUserId()%>" name="rating" value="5">
				<label for="star5_<%=d_id%>_<%=ap.getUserId()%>"><i class="fas fa-star"></i></label>
								                    
				<input type="radio" id="star4_<%=d_id%>_<%=ap.getUserId()%>" name="rating" value="4" >
				<label for="star4_<%=d_id%>_<%=ap.getUserId()%>"><i class="fas fa-star"></i></label>
								                    
				<input type="radio" id="star3_<%=d_id %>_<%=ap.getUserId()%>" name="rating" value="3">
				<label for="star3_<%=d_id%>_<%=ap.getUserId()%>"><i class="fas fa-star"></i></label>
								                    
				<input type="radio" id="star2_<%=d_id %>_<%=ap.getUserId()%>" name="rating" value="2">
				<label for="star2_<%=d_id%>_<%=ap.getUserId()%>"><i class="fas fa-star"></i></label>
								                    
				<input type="radio" id="star1_<%=d_id %>_<%=ap.getUserId()%>" name="rating" value="1">
				<label for="star1_<%=d_id%>_<%=ap.getUserId()%>"><i class="fas fa-star"></i></label>
				
			</div>
			
			<button type="submit" class="btn"><i class="fa-solid fa-check" style="color: #050505;"></i></button>
		</form>												 					

	  <% 			
			
		} else {
			int rating = rdao.getRating(ap.getUserId(), ap.getDoctor());
			
	%>
	
		<label>Your Rating : </label>

			<% for(int i=0;i<rating;i++) { %>
			<form class="text-center">
				<div id="rating" class="rating text-center mt-2">
					<label for="star"><i class="fas fa-star text-warning"></i></label>
				</div>
				<% } %>	
			</form>
			
	<%  } %>
	
	</div>

	
	<% 	
		  }
		}
	%>
	
	




</body>
</html>