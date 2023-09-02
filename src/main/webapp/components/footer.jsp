<%@page import="java.time.Year,java.time.LocalDate" %>

<!-- Footer -->
<footer class=" footer text-center text-white">
  <!-- Grid container -->
  <div class="container p-4">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-facebook-f"></i
      ></a>

      <!-- Twitter -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-twitter"></i
      ></a>

      <!-- Google -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-google"></i
      ></a>

      <!-- Instagram -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-instagram"></i
      ></a>

      <!-- Linkedin -->
      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-linkedin-in"></i
      ></a>

      <!-- Github -->
      <a class="btn btn-outline-light btn-floating m-1" target="_blank" href="https://github.com/Ash-2903/Online-Doctor-Consultation-Website" role="button"
        ><i class="fab fa-github"></i
      ></a>
    </section>
    <!-- Section: Social media -->

    <!-- Section: Form -->
    <section class="">
      <form action="">
        <!--Grid row-->
        <div class="row d-flex justify-content-center">
          <!--Grid column-->
          <div class="col-auto">
            <p class="pt-2">
              <strong>Sign up for our service</strong>
            </p>
          </div>
          <!--Grid column-->


          <!--Grid column-->
          <div class="col-auto">
            <!-- Submit button -->
            <a href="#">
	            <button type="submit" class="btn btn-outline-light mb-4">
	              Register
	            </button>
            </a>
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </form>
    </section>
    <!-- Section: Form -->

    <!-- Section: Text -->
    <section class="mb-4">
      <p>
        Whether you need a routine check-up, medical advice, or a second opinion, our virtual consultations provide personalized care tailored to your needs. 
        Your health is our priority, and we're committed to offering you a seamless, secure, and compassionate healthcare experience online
      </p>
    </section>
    <!-- Section: Text -->

    <!-- Section: Links -->
    <section class="">
      <!--Grid row-->
      <div class="row">
        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Links</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">About Us</a>
            </li>
            <li>
              <a href="#!" class="text-white">Testimonials</a>
            </li>
            <li>
              <a href="#!" class="text-white">Blog</a>
            </li>
            <li>
              <a href="#!" class="text-white">Privacy Policy</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Links</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">Contact Us</a>
            </li>
            <li>
              <a href="#!" class="text-white">Terms of Use</a>
            </li>
            <li>
              <a href="#!" class="text-white">Accreditations</a>
            </li>
            <li>
              <a href="#!" class="text-white">Accessibility Statement</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Links</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">Services</a>
            </li>
            <li>
              <a href="#!" class="text-white">Sitemap</a>
            </li>
            <li>
              <a href="#!" class="text-white">Reviews</a>
            </li>
            <li>
              <a href="#!" class="text-white">Newsletter Signup</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Links</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">Doctors</a>
            </li>
            <li>
              <a href="#!" class="text-white">Social Media Links</a>
            </li>
            <li>
              <a href="#!" class="text-white">Articles</a>
            </li>
            <li>
              <a href="#!" class="text-white">Certifications</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->
      </div>
      <!--Grid row-->
    </section>
    <!-- Section: Links -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <%
	  Year currentYear = Year.now();
	  int yearValue = currentYear.getValue();
  %>
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © <%= yearValue %> Copyright:
    <a class="text-white" href="index.jsp">CureQuest.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->

<style>

	.footer {
		background-color : #0E2954;
		 bottom: 0;
		 width: 100%;
		 min-height: 20rem;
	}

</style>