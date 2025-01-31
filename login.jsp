<%@ page import="java.util.*, java.io.*, org.json.simple.*, org.json.simple.parser.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet"
  >
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
  />
  <style>
    body {
      background-color: #f8f9fa;
    }
    .login-container {
      max-width: 400px;
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    .login-container h1 {
      font-size: 24px;
      margin-bottom: 20px;
    }
    .btn-primary {
      width: 100%;
    }
    .form-text {
      font-size: 0.85rem;
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
<!-- parse users.json to do a  basic login check  -->
<%
  String loginError = null;
  if("POST".equalsIgnoreCase(request.getMethod())){
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // parse users.json. 
    JSONParser parser = new JSONParser();
    try {
      //expects users.json in the same dir., or  can store it in webinf
      String realPath = application.getRealPath("/users.json");
      FileReader reader = new FileReader(realPath);
      JSONObject root = (JSONObject) parser.parse(reader);
      JSONObject usersObj = (JSONObject) root.get("users");
      if(usersObj.containsKey(email)) {
        JSONObject userData = (JSONObject) usersObj.get(email);
        String passInJson = (String) userData.get("password");
        if(passInJson.equals(password)) {
          // success
          session.setAttribute("isLoggedIn", true);
          response.sendRedirect("index.jsp");
        } else {
          loginError = "Invalid email or password.";
        }
      } else {
        loginError = "No user found with that email, sorry!";
      }
    } catch(Exception e) {
      loginError = "Error reading user data: " + e.getMessage();
    }
  }
%>
<div class="login-container">
  <h1 class="text-center">Login</h1>
  <% if(loginError != null){ %>
    <div class="alert alert-danger"><%= loginError %></div>
  <% } %>
  <form method="POST" action="login.jsp">
    <div class="mb-3">
      <label for="email" class="form-label">Email address</label>
      <input 
        type="email" 
        class="form-control" 
        id="email" 
        name="email"
        placeholder="Enter your email"
        required
      >
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input 
        type="password" 
        class="form-control" 
        id="password"
        name="password"
        placeholder="Enter your password"
        required
      >
    </div>
    <button type="submit" class="btn btn-primary">Log In</button>
    <div class="text-center mt-3">
      <a href="contact.jsp" class="text-decoration-none">Forgot your password?</a>
    </div>
    <div class="text-center mt-3">
      <p class="form-text">Don't have an account? <a href="contact.jsp">Contact Us</a></p>
    </div>
  </form>
</div>

<footer class="bg-dark text-white text-center py-3 mt-5">
  <div class="container">
    <p class="mb-1">
      &copy; <span id="year"><%
        out.print(Calendar.getInstance().get(Calendar.YEAR));
      %></span> South Ottawa Softball. All Rights
      Reserved.
    </p>
    <p>
      <a href="privacy.html" class="text-light text-decoration-none mx-2"
        >Privacy Policy</a>
      <a href="terms.html" class="text-light text-decoration-none mx-2"
        >Terms of Service</a>
    </p>
  </div>
</footer>

<!-- bootstrap js -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
