<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="mystyle.css">
    <title>Quick Treat</title>
    <%@include file="../components/common_css.jsp" %>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital@1&display=swap" rel="stylesheet">

<style>

.size{
    width: 200px;
    height: 200px;
}

.img{
    display: flex;
    justify-content: center;
}

.box{
    box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}

.treat{
    font-weight: bold;
    padding-bottom: 0.3rem;
    text-align: center;
    font-size: 20px;
}

table{
    margin: 40px;
    padding: 40px;
}
td{
    margin: 20px;
}

tr{
    padding: 20px;
    word-spacing: 10px;
    text-align: center;
}

p{
    padding-left: 20px;
    padding-right: 20px;
}

#message{
    text-align: justify;
    font-size:30px; 
    font-family: 'Libre Baskerville', serif;
}

input{
    border-radius: 3rem;
    padding: 0.5rem;
}

.searchbox{
    float: right;
    padding: 3px 17px;
}

.footersize{
    width: 30px;
    height: 30px;
}
/* cartoons --- treat */

</style>


  </head>
  

  <body>
  
    
  <header data-bs-theme="dark" class="mb-5">
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
  
  <header id="top">
    <div class="searchbox mt-4"><input type="text" name="" id="s" placeholder="Search" onkeyup="search()"> 
    <label for="s"> <img class="footersize" src="https://cdn-icons-png.flaticon.com/512/49/49116.png" alt="error loading image"/> </label></div><br>
  </header>
  
  <br><br>
    
    <table class="arrange" id="table">
    <tr class="p-4">
      <td id="message" style="display: none"></td>
      <td class="box p-4">
        <div class="treat">CPR</div>
        <div><a href="https://youtu.be/ozzZVQQTvo4?si=TyDG79sn-SlhQarV" target="_blank"><img class="size" src="https://us.123rf.com/450wm/apichetdoungchuen/apichetdoungchuen2005/apichetdoungchuen200500193/146130885-heart-cpr-medical-icon-vector-design.jpg?ver=6"alt="error loading image"/></a></div>
        <p>Cardiopulmonary resuscitation (CPR) is an emergency procedure that can help save a person's life if their breathing or heart stops.</p>
      </td>
      <td class="box">
        <div class="treat">Electric shock</div>        
        <div><a href="https://youtu.be/7B5HvvWesxo?si=IAcSlO09yH5_AIFG" target="_blank"><img class="size" src="https://st2.depositphotos.com/6660138/9512/v/950/depositphotos_95120130-stock-illustration-electric-shock-first-aid.jpg"alt="error loading image"/></a></div>
        <p>If any part of your body meets live electricity an electric current flows through the tissues and causes an electric shock.</p>
      </td>
      <td class="box">
        <div class="treat">Choking</div>        
        <div><a href="https://youtu.be/dSfXcQqLZqs?si=8X3dSet1G66LfRBV" target="_blank"><img class="size" src="data:image/jpeg;base64,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"alt="error loading image"/></a></div>
        <p>Choking is partial or complete obstruction in the food pipe or throat due to a foreign body such as food, water, a toy, etc.</p>
      </td>
    </tr>
    <tr>
      <td class="box">
        <div class="treat">Seizure</div>        
        <div><a href="https://youtu.be/jJWfHHqfSbk?si=PMkGLEpYHtmcgtLD" target="_blank"><img class="size" src="https://as2.ftcdn.net/jpg/03/13/63/05/160_F_313630586_aAxWX9lep9OR8QUjZDY8KtxxA85k3PAU.jpg"alt="error loading image"/></a></div>
        <p>A seizure is a sudden, uncontrolled burst of electrical activity in the brain. It can cause changes in behavior, movements, feelings and levels of consciousness.</p>
      </td>
      <td class="box">
        <div class="treat">Snake bite</div>        
        <div><a href="https://youtu.be/nH8o-bgwo_g?si=vhLWLivdU4TxYftx" target="_blank"><img class="size" src="https://media.istockphoto.com/id/1491357984/vector/snake-bite-person-leg.jpg?s=612x612&w=0&k=20&c=ppiGvnOc52YtSyLwRL1d8r91_m-sJx3ErwiLkp-wjFs="alt="error loading image"/></a></div>
        <p>A snake bite is an injury caused by a bite from a snake. It can be life-threatening if the snake is venomous. Symptoms may include pain, swelling, redness or bleeding at the site of the bite.</p>
      </td>
      <td class="box">
        <div class="treat">Epistaxis or Nose bleed</div>        
        <div><a href="https://youtu.be/r5sVCuFYDJw?si=qVjppk0mfVTeLSgn" target="_blank"><img class="size" src="https://media.istockphoto.com/id/1350212888/vector/young-woman-with-a-nosebleed-in-flat-design-on-white-background.jpg?s=612x612&w=0&k=20&c=Xnna4l6YxjUvHYkI3alLawTksMO4_HGSRoHMpkbxV4k="alt="error loading image"/></a></div>
        <p>Epistaxis is when you lose blood from the tissue that lines the inside of your nose. A combination of dry air and tiny blood vessels that line the inner surface of your nose often cause nosebleeds.</p>
      </td>
    </tr> 
    </table>
    
    <script>

const search = () =>{
    let input = document.getElementById('s').value.toUpperCase();

    let mytable =  document.getElementById('table');

    let name = document.getElementsByClassName('treat');

    let content = mytable.getElementsByClassName('box');

    for(var i=0; i<name.length;i++)
    {
        if(name)
        {
            let textvalue = name[i].textContent || name[i].innerHTML;

            if(textvalue.toUpperCase().indexOf(input) > -1)
            {
                content[i].style.display="";
            }
            else{
                content[i].style.display="none";
            }
        }
    }

    let notFound = true;
    for (let i = 0; i < name.length; i++) {
      if (content[i].style.display != "none") {
        notFound = false;
        break;
      }
    }
  
    let message = document.getElementById('message');
    if (notFound) {
      message.innerHTML = "RESULTS NOT FOUND";
      message.style.display = "";
    } else {
      message.style.display = "none";
    }
}

    </script>


	<%@include file="../components/footer.jsp" %>

  </body>
  </html>