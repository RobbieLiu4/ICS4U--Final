<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Who We Are</title>
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
  <style>
    .hero-section {
      background: url('https://cdn.glitch.global/1dc13e00-e04f-48b4-b6e2-ec47e56bd016/softball%20casual%20photoo.jpg?v=1737469810039') no-repeat center center/cover;
      height: 300px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
    }
    .hero-section h1 {
      font-size: 3rem;
      font-weight: bold;
      text-shadow: 2px 2px 6px rgba(0,0,0,0.6);
    }
    .softball-photo {
      max-width: 100%;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }
    .section-content {
      margin-top: 2rem;
    }
  </style>
</head>
<body>
<!-- Top bar -->
<div class="bg-dark text-white py-2">
  <div class="container d-flex justify-content-between align-items-center">
    <div>
      <a
        href="team-finder.jsp"
        class="text-white text-decoration-none me-3"
        >Team Finder</a>
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
            <li><a class="dropdown-item" href="schedule.jsp">Schedule</a></li>
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

<!-- sect. -->
<section class="hero-section">
  <h1>Who We Are</h1>
</section>

<div class="container section-content">
  <div class="row">
    <div class="col-md-6 mb-4">
      <h2>About Our League</h2>
      <p>
        South Ottawa Softball is a community-driven organization dedicated to bringing adults 
        together through the love of softball. We offer a welcoming and inclusive environment 
        for players of all skill levels, where fun, teamwork, and personal growth take center stage.
      </p>
      <p>
        Our programs are purely recreational, focusing on building friendships and creating
        enjoyable experiences on the field. With passionate organizers and well-maintained 
        facilities, we provide the perfect setting for players to connect and have fun.
      </p>
    </div>
    <div class="col-md-6 text-center">
      <img 
        src="https://cdn.glitch.global/1dc13e00-e04f-48b4-b6e2-ec47e56bd016/softballsample%20photott.jpg?v=1737469506102" 
        alt="Softball League" 
        class="img-fluid softball-photo"
      >
    </div>
  </div>

  <div class="mt-5">
    <h2>Our Roots</h2>
    <p>
      Established over a decade ago, our league has grown from a small group of friends
      to a vibrant community. We remain committed to nurturing young talent, promoting
      teamwork, and creating an inclusive atmosphere where every member can thrive.
    </p>
    <p>
      Whether it's organizing community fundraisers or hosting friendly exhibition games,
      we believe in giving back and building strong connections. We celebrate each
      player's journey and look forward to new chapters in our ongoing story.
    </p>
  </div>
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
<!-- bootstrap JS -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
