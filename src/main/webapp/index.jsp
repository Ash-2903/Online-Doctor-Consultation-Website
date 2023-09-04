<%@page import = "com.db.DBConnect" %>
<%@page import = "java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	
	
<!doctype html>

<html lang="en" data-bs-theme="auto">

  <head>
  	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Cure Quest</title>
    
    <%-- <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>  --%>

	<!-- Bootstrap links -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
	<link href="https://getbootstrap.com/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<%@include file="components/common_css.jsp" %>

    <!-- Custom styles for this template -->
    <link href="css/styles.css" rel="stylesheet">
    
    <style>
    	.bgImg {
			height : 80vh;
			width: 100%;
			bachground-size: cover;
			background-repeat: no-repeat;
		}
    </style>
    
    
  </head>
  
  
  <body style="background-color : #F5F5F5; padding-top: 0px;padding-bottom: 0px"> 
    
    <!-- ======================= FIXED NAVIGATION BAR ===========================  -->
    
	<%
    	if(session.getAttribute("adminObject")!=null) {
    		response.sendRedirect("admin/index.jsp");
    	} else if(session.getAttribute("doctorObject")!=null) {
    		response.sendRedirect("doctor/index.jsp");
    	}
    %>
	
	<div>
		<%@include file="components/navbar.jsp" %> 
	</div>
	
	
	
	
	
	<!-- ======================= SQL CONNECTION ===========================  -->
	
	<%-- <% Connection conn = DBConnect.getConn(); 
	out.print(conn);
	%> --%>

<main>

	<!-- ========================== CAROUSEL ===========================  -->

  <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel" data-bs-theme="light">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    
    <div class="carousel-inner">
    
     <div class="carousel-item active">
      <img class="bgImg" src="https://www.cmss.gov.in/wp-content/uploads/2021/12/Slider-new.jpg" />
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Your Health, Your Way</h1>
            <p class="opacity-75">Our platform offers a wide range of medical specialties to cater to your specific health concerns.</p>
            <p><a class="btn btn-lg btn-primary" href="signup.jsp">Sign up</a></p>
          </div>
        </div>
      </div>
      
      <div class="carousel-item">
        <img class="bgImg" src="https://static.vecteezy.com/system/resources/thumbnails/006/712/985/small/abstract-health-medical-science-healthcare-icon-digital-technology-science-concept-modern-innovation-treatment-medicine-on-hi-tech-future-blue-background-for-wallpaper-template-web-design-vector.jpg" />
        <div class="container">
          <div class="carousel-caption">
            <h1>Expert Care, Anywhere You Are</h1>
            <p>Distance is no longer a barrier to exceptional medical expertise.</p>
            <p><a class="btn btn-lg btn-primary" href="static_pages/info1.jsp">Learn About Specialists</a></p>
          </div>
        </div>
      </div>
      
     <div class="carousel-item">
        <img class="bgImg" src="https://www.lingualinx.com/hubfs/hospital-translations.jpg" />
        <div class="container">
          <div class="carousel-caption text-end">
            <h1>Confidentiality and Compassion Combined</h1>
            <p>Prioritizing a confidential and empathetic environment for consultations.</p>
            <p><a class="btn btn-lg btn-primary" href="static_pages/info2.jsp">Know About First-Aid</a></p>
          </div>
        </div>
      </div> 
      
    </div>
    
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>


  <!-- ======================= MARKETING MESSAGE ===========================  -->
  

  <div class="container marketing">

	<h1 class="text-center mb-5" style=color:#706f6f > <span class="display-4 fw-bold" style=color:#749BC2>3 </span>Simple steps for safest treatment</h1><br>

    <!-- Three columns of text below the carousel -->
    
    <div class="row">
    
      <div class="col-lg-4">
        <i class="fa-solid fa-list fa-2xl" style="color: #2d3649; height: 40px"></i>
        <h2 class="fw-normal"> Fill the form</h2>
        <p>Create an account and make an appointment.</p>
      </div>
      
      <div class="col-lg-4">
        <i class="fa-solid fa-user-doctor fa-2xl" style="color: #2d3649; height: 40px;"></i>
        <h2 class="fw-normal">Doctor</h2>
        <p>We will help you choose the right doctor.</p>
      </div>
      
      <div class="col-lg-4">
        <i class="fa-solid fa-video fa-2xl" style="color: #2d3649; height: 40px;"></i>
        <h2 class="fw-normal">Consultation</h2>
        <p>Consult the doctor online and avail the safest treatment</p>
        <!-- <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p> -->
      </div>

    </div>


    <!-- ======================= 3 FEATURETTES ===========================  -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h1 class="text-center mb-5" style=color:#706f6f >Our Services <span class="text-body-secondary"></span></h1>
        <p class="lead">Our online doctor consultation platform provides you with access to qualified and experienced medical professionals from various specialties. 
        		Whether you need a general health check-up, advice on a specific medical concern, or a second opinion, our team of licensed doctors is here to help. 
        		</p>
      </div>
      <div class="col-md-5">
      		<img src="https://img.freepik.com/premium-photo/closeup-black-doctor-advising-patient-during-video-call-smart-phone_637285-12133.jpg" height=400px alt="image"> 
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h1 class="text-center mb-5" style=color:#706f6f >How It Works </h1>
        <p class="lead  ms-5">1. Sign Up - Create an account on our platform and provide your basic medical history.</p>
        <p class="lead  ms-5">2. Book a Consultation - Choose a suitable date and time for your online consultation.</p>
        <p class="lead  ms-5">3. Speak to a Doctor - Connect with a certified doctor via secure video call.</p>
        <p class="lead  ms-5">4. Receive Medical Advice - Discuss your symptoms, receive a diagnosis, and get personalized treatment recommendations.</p>
        <p class="lead  ms-5">5. Prescriptions - Get prescriptions from your doctors during the end of the session.</p>
      </div>
      <div class="col-md-5 order-md-1">
     	<img src="https://media.istockphoto.com/id/1132186568/photo/shopping-cart-toy-with-medicaments-in-front-of-laptop-screen-with-pharmacy-web-site-on-it.jpg?s=612x612&w=0&k=20&c=irqkSTLLLcYCHY6lGHq1hY4T0_jfKfyWlyydMj8l5a8=" height=400px align=right alt="image">     
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h1 class="text-center mb-5" style=color:#706f6f >Why Choose Us</h1>
        <p class="lead">Access healthcare services from the comfort of your home, eliminating the need to travel and wait in crowded clinics.
        	Our platform hosts a diverse team of qualified doctors across various medical fields, ensuring you receive accurate and specialized guidance.
        </p>
      </div>
      <div class="col-md-5">
     	  <img src="https://benefits.vmware.com/wp-content/uploads/2016/06/medical-2.jpg" height=400px alt="image">
     </div>
    </div>

    <hr class="featurette-divider">


  </div>
  
  <!-- ======================= FOOTER ===========================  -->


  <!-- FOOTER -->
  
  <%@include file="components/footer.jsp" %>
  
</main>
<script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>



    </body>
</html>
	
	
 
