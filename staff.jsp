<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Staff Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- bootstrap CSS -->
  <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet"
  >
  <!-- bootstrap icons -->
  <link 
    rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
  >
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  
<!-- Top bar -->
<div class="bg-dark text-white py-2">
  <div class="container d-flex justify-content-between align-items-center">
    <div>
      <a
        href="team-finder.jsp"
        class="text-white text-decoration-none me-3"
        >Team Finder</a
      >
      <a
        href="https://www.facebook.com/sos.softball.3"
        target="_blank"
        class="text-white text-decoration-none me-3"
      >
        <i class="bi bi-facebook"></i>
      </a>
    </div>
    <div>
      <a href="contact.jsp" class="text-white text-decoration-none me-3">
        <i class="bi bi-envelope-fill"></i> Contact
      </a>
      <a href="search.jsp" class="text-white text-decoration-none me-3">
        <i class="bi bi-search"></i> Search
      </a>
      <a href="login.jsp" class="text-white text-decoration-none">
        <i class="bi bi-box-arrow-in-right"></i> Login
      </a>
    </div>
  </div>
</div>

<!-- Main nav -->
<nav class="navbar navbar-expand-lg" style="background-color: #f0f0f0">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">South Ottawa Softball</a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarNav"
      aria-controls="navbarNav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon">&#9776;</span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="aboutUsDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            About Us
          </a>
          <ul class="dropdown-menu" aria-labelledby="aboutUsDropdown">
            <li><a class="dropdown-item" href="staff.jsp">Staff</a></li>
            <li>
              <a class="dropdown-item" href="contact.jsp">Contact Us</a>
            </li>
            <li>
              <a class="dropdown-item" href="who-we-are.jsp">Who We Are</a>
            </li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="gamesDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            Games
          </a>
          <ul class="dropdown-menu" aria-labelledby="gamesDropdown">
            <li>
              <a class="dropdown-item" href="schedule.jsp">Schedule</a>
            </li>
            <li><a class="dropdown-item" href="scores.jsp">Scores</a></li>
            <li><a class="dropdown-item" href="calendar.jsp">Calendar</a></li>
            <li><a class="dropdown-item" href="standings.jsp">Standings</a></li>
            <li><a class="dropdown-item" href="tournament.jsp">Tournament</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="discussion.jsp">Discussion</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- main staff Section -->
<div class="container mt-5" id="main-staff">
  <h2>Main Staff</h2>
  <div class="accordion" id="mainStaffAccordion">
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingOne">
        <button 
          class="accordion-button collapsed" 
          type="button" 
          data-bs-toggle="collapse" 
          data-bs-target="#collapseOne" 
          aria-expanded="false" 
          aria-controls="collapseOne"
        >
          John Smithinson (Manager)
        </button>
      </h2>
      <div 
        id="collapseOne" 
        class="accordion-collapse collapse" 
        aria-labelledby="headingOne" 
        data-bs-parent="#mainStaffAccordion"
      >
        <div class="accordion-body">
          <p>Email: john.smithinson@gmail.com</p>
          <p>Phone: 343-456-7890</p>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingTwo">
        <button 
          class="accordion-button collapsed" 
          type="button" 
          data-bs-toggle="collapse" 
          data-bs-target="#collapseTwo" 
          aria-expanded="false" 
          aria-controls="collapseTwo"
        >
          Jane Darn (Coordinator)
        </button>
      </h2>
      <div 
        id="collapseTwo" 
        class="accordion-collapse collapse" 
        aria-labelledby="headingTwo" 
        data-bs-parent="#mainStaffAccordion"
      >
        <div class="accordion-body">
          <p>Email: jane.darn@gmail.com</p>
          <p>Phone: 613-567-8901</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- coaching staff Section -->
<div class="container mt-5" id="coaching-staff">
  <h2>Coaching Staff</h2>
  <ul class="list-group">
    <li class="list-group-item">Coach 1: Mike Roberts</li>
    <li class="list-group-item">Coach 2: Sarah Johnson</li>
    <li class="list-group-item">Coach 3: David Peterson</li>
  </ul>
</div>
  
<footer class="bg-dark text-white text-center py-3 mt-5">
  <div class="container">
    <p class="mb-1">
      &copy; <span id="year"><%
        out.print(Calendar.getInstance().get(Calendar.YEAR));
      %></span> South Ottawa Softball. All Rights Reserved.
    </p>
    <p>
      <a href="privacy.html" class="text-light text-decoration-none mx-2"
        >Privacy Policy</a
      >
      <a href="terms.html" class="text-light text-decoration-none mx-2"
        >Terms of Service</a
      >
    </p>
  </div>
</footer>

<!-- bootstrap js -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
