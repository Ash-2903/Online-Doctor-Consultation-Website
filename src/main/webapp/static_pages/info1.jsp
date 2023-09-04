<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Know More</title>
    <%@include file="../components/common_css.jsp" %>
    <link rel="stylesheet" href="./style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Caveat&family=Exo+2:wght@300&family=Libre+Baskerville&display=swap" rel="stylesheet">

<style>

.img{
    height: 200px;
    width: 100px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    overflow: hidden;
}

h2,h4{
    font-family: 'Caveat', cursive;
font-family: 'Exo 2', sans-serif;
font-family: 'Libre Baskerville', serif;
}



td{
    padding: 10px;
    word-spacing: 10px;
    text-align: center;
    border-radius: 15px;
    border-spacing: 10px;
    overflow: hidden;
    margin: 40px;
    
}
table{
    border-radius: 15px;
  }


#al1{
    background-color: #F9F5F6;
}

#al2{
    background-color: #DAF5FF;
}

</style>

</head>
<body>

	<header data-bs-theme="dark">
	  <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #B0DAFF; color:black">
		    <div class="container-fluid">
			      <a class="navbar-brand" href="../index.jsp">
			    		<i class="fa-solid fa-stethoscope fa-beat"></i>
			    		Cure Quest
			      </a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
		    </div>
	    </nav>
    </header>

	<table id="al1" class="tab1 doc">
        <tr>
          <td colspan="3">
            <div>
              
              <br>
              <br>
              <h2 class="mt-4">PRIMARY CARE PHYSICIANS</h2>
              <br>
              <p>Doctors who serve as the first point of contact for individuals seeking healthcare.They provide a wide range of general medical services, including preventive care, routine check-ups, diagnasis and treatment of common illness and injuries.</p>
            </div>
          </td>
        </tr>
        <tr>
          <td id="med">
            <div>
              <img src="imgs/fm.png" height="150px" width="150px">
              <h4>Family Medicine</h4>
              <p>Offers comprehensive care to individuals of all ages, emphasizing family health.</p>
            </div>
          </td>
          <td id="med">
            <div>
              <img src="imgs/im.png" height="150px" width="150px">
              <h4>Internal Medicine</h4>
              <p>Focuses on adult healthcare, managing complex diseases and general well-being.</p>
            </div>
          </td>
          <td id="med">
            <div>
              <img src="imgs/ped.png" height="150px" width="150px">
              <h4>Pediatrician</h4>
              <p>Provides medical care to infants, children and adolescents, including preventive care.</p>
              <br>
              </div>
          </td>
        </tr>
      </table>

      <table id="al2" class="tab2 doc">
        
        <tr>
          <td colspan="4">
            <div>
              <br>
              <br>
              <h2>SPECIALISTS</h2>
              <br>
              <p>Medical doctors who have completed additional training and education in a specific area of medicine beyond their basic medical degree. These additional years of training make them experts in their chosen field.</p>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <div>
              <img src="imgs/car.png" height="150px" width="150px">
              <h4>Cardiologist</h4>
              <p>Deals with heart-related problems, such as heart attacks and heart failure.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/der.png" height="150px" width="150px">
              <h4>Dermatologist</h4>
              <p>Diagnoses and treats disorders of the skin, hair and nails.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/neu.png" height="150px" width="150px">
              <h4>Neurologist</h4>
              <p>Treats disorders of the nervous system, including brain, spinal cord and nerves.</p>
              </div>
          </td>
          <td>
            <div>
              <img src="imgs/gas.png" height="150px" width="150px">
              <h4>Gastroenterologist</h4>
              <p>Manages issues of the digestive system, including the stomach, intestines and liver.</p>
            </div>
          </td>
        </tr>
        <tr id="med">
          <td>
            <div>
              <img src="imgs/opt.png" height="150px" width="150px">
              <h4>Opthomologist</h4>
              <p>Provides eye care, including diagnosis and treatment of eye diseases.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/ent.png" height="150px" width="150px">
              <h4>Otolaryngologist (ENT)</h4>
              
              <p>Manages ear, nose, and throat disorders, including surgeries.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/uro.png" height="150px" width="150px">
              <h4>Urologist</h4>
              <p>Deals with urinary tract and male reproductive system problems.</p>
              </div>
          </td>
          <td>
            <div>
              <img src="imgs/end.png" height="150px" width="150px">
              <h4>Endocrinologist</h4>
              <p>Diagnoses and treats hormonal imbalances and endocrine system disorders.</p>
            </div>
          </td>
        </tr>
        <tr id="med">
          <td>
            <div>
              <img src="imgs/psyf.png" height="150px" width="150px">
              <h4>Psychiatrist</h4>
              <p>Specializes in mental health, diagnosing and treating mental illness.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/imm.png" height="150px" width="150px">
              <h4>Allergist/Immunologist</h4>
              <p>Manages allergies and immune system disorders.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/rad.png" height="150px" width="150px">
              <h4>Radiologist</h4>
              <p>Specializes in reading and interpreting medical imaging.</p>
              </div>
          </td>
          <td>
            <div>
              <img src="imgs/rhe.png" height="150px" width="150px">
              <h4>Rheumatologist</h4>
              <p>Diagnoses and treats autoimmune and musculoskeletal disorders.</p>
              <br>
            </div>
          </td>
        </tr>
      </table>

      <table id="al1" class="tab3 doc">
        <tr>
          <td colspan="3">
            <div>
              
              <br>
              <br>
              <h2>OBSTETRICS AND GYNECOLOGY</h2>
              <br>
              <p>Medical doctors who specialize in women's health, particularly during pregnancy, childbirth, and the female reproductive system. They provide a wide range of care and services.</p>
            </div>
          </td>
        </tr>
        <tr id="med">
          <td>
            <div>
              <img src="imgs/obs.png" height="150px" width="150px">
              <h4>Obstetrician</h4>
              <p>Cares for pregnant women, including pretanal, childbirth, and postnatal care.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/gyn.png" height="150px" width="150px">
              <h4>Gynecologist</h4>
              <p>Focuses on women's reproductive health and the female reproductive system.</p>
              <br>
            </div>
          </td>
        </tr>
      </table>


      <table id="al2" class="tab4 doc">
        <tr>
          <td colspan="3">
            <div>
              
              <br>
              <br>
              <h2>SURGICAL SPECIALISTS</h2>
              <br>
              <p>Medical doctors who have undergone extensive training in surgical procedures and techniques. They specialize in performing surgeries within a specific area of medicine, which can range from general surgery to highly specialized fields.</p>
            </div>
          </td>
        </tr>
        <tr id="med">
          <td>
            <div>
              <img src="imgs/gs.png" height="150px" width="150px">
              <h4>General Surgeon</h4>
              <p>Performs a variety of surgical procedures and interventions.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/cs.png" height="150px" width="150px">
              <h4>Cardiothoracic Surgeon</h4>
              <p>Conducts surgeries on the heart and chest cavity.</p>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <div>
              <img src="imgs/ns.png" height="150px" width="150px">
              <h4>Neurosurgeon</h4>
              <p>Specializes in surgical treatments of the nervous system, including the brain and spine.</p>
            </div>
          </td>
          <td>
            <div>
              <img src="imgs/os1.png" height="150px" width="150px">
              <h4>Orthopedic Surgeon</h4>
              <p>Performs surgeries and treats injuries related to the musculoskeletal system.</p>
              <br>
            </div>
          </td>
        </tr>
      </table>
      
      	<%@include file="../components/footer.jsp" %>

</body>
</html>