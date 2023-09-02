<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
	if (session.getAttribute("userObject") == null) {
		response.sendRedirect("user_login.jsp");
	    return;
	}
%>
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
	
</style>
<script>
// Function to filter table rows based on selected specialist
function filterTable() {
    var selectedSpecialist = document.getElementById("specialistSelect").value;
    var tableRows = document.querySelectorAll(".data-row");

    for (var i = 0; i < tableRows.length; i++) {
        var specialistCell = tableRows[i].querySelector(".specialist-cell");
        if (selectedSpecialist === "" || specialistCell.textContent === selectedSpecialist) {
            tableRows[i].style.display = "table-row";
        } else {
            tableRows[i].style.display = "none";
        }
    }
}
</script>
</head>
<body style="background-color : #F5F5F5">	


	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("userObject")==null)
		response.sendRedirect("user_login.jsp");
	%>

	<%@include file="components/navbar.jsp"%>
	

	
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						
						<div class="form-group row d-flex justify-content-center p-3">
							<label for="specialistSelect" class="col-1 mr-0 col-form-label" style="width: 74px;">Sort :</label>
							<div class="col-md-2">
								
									
									<select required class="form-control" id="specialistSelect" onchange="filterTable()">
									<option value="">All</option>
									<% 
										SpecialistDao sp = new SpecialistDao(DBConnect.getConn());
										List<Specialist> list = sp.getAllSpecialist();
										for(Specialist s:list)  {
									%>
										<option value="<%=s.getSpecialistName()%>"><%= s.getSpecialistName() %> </option>
									<% } %>
							</select>
						</div>
						</div>
						
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
								</tr>
							</thead>
							<tbody>
								<%
									DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
									List<Doctor> list2 = dao2.getAllDocs();
									for (Doctor d : list2) {
										/* System.out.println(d.getId); */
								%>
								<tr class="data-row">
									<%-- <td><%=d.getId()%></td> --%>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td class="specialist-cell"><%=d.getSpecialization()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getPhno()%></td>
									
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