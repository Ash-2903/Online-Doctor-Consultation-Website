


 <nav class="navbar navbar-expand-lg" style="background-color: #B0DAFF; color:black">

  <div class="container-fluid">
  
    <a class="navbar-brand" href="index.jsp" style="color:black">
    		<i class="fa-solid fa-stethoscope fa-beat" style="color:black"></i>
    		Cure Quest
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp" style="color:black">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" href="patients.jsp" style="color:black">Patient</a>
        </li>
        
       </ul>
       
       
      
       
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
       
       <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:black; hover:blue;">
			          	<i class="fa-solid fa-user-doctor fa-lg"></i>
			            ${doctorObject.fullName}
		  </a>
          <ul class="dropdown-menu">

            <li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
          </ul>
        </li>
        
       </ul>
       
      </div>
      
    

        
      

      
    </div>
  </div>
</nav> 

