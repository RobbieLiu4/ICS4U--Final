<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Softball Scores</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet"
  >
  <link 
    rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
  >
  <link rel="stylesheet" href="styles.css">
  <style>
    .d-none {
      display: none !important;
    }
  </style>
</head>
<body>
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

<div class="container my-5">
  <h1 class="mb-4">South Ottawa Softball 2025 Scores</h1>
  <%
    // do "page" param..
    String pageParam = request.getParameter("page");
    if(pageParam == null) pageParam = "1";
    int currentPage = Integer.parseInt(pageParam);

    //define total pages = 3
    int totalPages = 3;
  %>

  <%
    //if statements to show/hide certain sections
    // or  can store it in arrays but ima do direct
  %>
  <% if(currentPage == 1){ %>
    <div>
      <div class="card mb-4">
        <div class="card-header bg-secondary text-white">
          REGULAR SEASON (Moose McGuire's Division)
        </div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0 text-center">
            <thead class="table-light">
              <tr>
                <th scope="col">Team</th>
                <th scope="col">1</th>
                <th scope="col">2</th>
                <th scope="col">3</th>
                <th scope="col">4</th>
                <th scope="col">5</th>
                <th scope="col">6</th>
                <th scope="col">7</th>
                <th scope="col">8</th>
                <th scope="col">9</th>
                <th scope="col">R</th>
                <th scope="col">H</th>
                <th scope="col">E</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Boomtown Bats</td>
                <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
                <td>0</td><td>0</td><td>0</td><td>0</td>
                <td>37</td><td>0</td><td>0</td>
              </tr>
              <tr>
                <td>Brew Jays</td>
                <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
                <td>0</td><td>0</td><td>0</td><td>0</td>
                <td>8</td><td>0</td><td>0</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-header bg-secondary text-white">
          REGULAR SEASON (Southside Division)
        </div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0 text-center">
            <thead class="table-light">
              <tr>
                <th>Team</th>
                <th>1</th><th>2</th><th>3</th><th>4</th><th>5</th>
                <th>6</th><th>7</th><th>8</th><th>9</th>
                <th>R</th><th>H</th><th>E</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Got The Runs</td>
                <td>1</td><td>2</td><td>0</td><td>0</td><td>3</td>
                <td>0</td><td>0</td><td>4</td><td>0</td>
                <td>10</td><td>12</td><td>1</td>
              </tr>
              <tr>
                <td>Raccoons</td>
                <td>0</td><td>1</td><td>2</td><td>2</td><td>0</td>
                <td>0</td><td>0</td><td>1</td><td>0</td>
                <td>6</td><td>9</td><td>3</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  <% } else if(currentPage == 2){ %>
    <div>
      <div class="card mb-4">
        <div class="card-header bg-secondary text-white">
          REGULAR SEASON (Moose McGuire's Division)
        </div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0 text-center">
            <thead class="table-light">
              <tr>
                <th>Team</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th>
                <th>6</th><th>7</th><th>8</th><th>9</th>
                <th>R</th><th>H</th><th>E</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Ball Crushers</td>
                <td>0</td><td>2</td><td>1</td><td>1</td><td>0</td>
                <td>0</td><td>3</td><td>0</td><td>0</td>
                <td>7</td><td>8</td><td>1</td>
              </tr>
              <tr>
                <td>No Stars</td>
                <td>1</td><td>0</td><td>0</td><td>2</td><td>0</td>
                <td>4</td><td>0</td><td>0</td><td>0</td>
                <td>7</td><td>10</td><td>2</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-header bg-secondary text-white">
          REGULAR SEASON (Southside Division)
        </div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0 text-center">
            <thead class="table-light">
              <tr>
                <th>Team</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th>
                <th>6</th><th>7</th><th>8</th><th>9</th>
                <th>R</th><th>H</th><th>E</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Southside Scandal</td>
                <td>2</td><td>0</td><td>1</td><td>0</td><td>3</td>
                <td>0</td><td>0</td><td>4</td><td>0</td>
                <td>10</td><td>11</td><td>2</td>
              </tr>
              <tr>
                <td>Wildcards</td>
                <td>0</td><td>3</td><td>0</td><td>2</td><td>1</td>
                <td>0</td><td>1</td><td>0</td><td>0</td>
                <td>7</td><td>9</td><td>1</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  <% } else { %>
    <div>
      <div class="card mb-4">
        <div class="card-header bg-secondary text-white">
          REGULAR SEASON (Moose McGuire's Division)
        </div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0 text-center">
            <thead class="table-light">
              <tr>
                <th>Team</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th>
                <th>6</th><th>7</th><th>8</th><th>9</th>
                <th>R</th><th>H</th><th>E</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Brew Jays</td>
                <td>0</td><td>2</td><td>0</td><td>0</td><td>3</td>
                <td>0</td><td>0</td><td>1</td><td>0</td>
                <td>6</td><td>10</td><td>1</td>
              </tr>
              <tr>
                <td>Brews on First</td>
                <td>1</td><td>0</td><td>4</td><td>0</td><td>0</td>
                <td>1</td><td>0</td><td>1</td><td>0</td>
                <td>7</td><td>8</td><td>2</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-header bg-secondary text-white">
          REGULAR SEASON (Southside Division)
        </div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0 text-center">
            <thead class="table-light">
              <tr>
                <th>Team</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th>
                <th>6</th><th>7</th><th>8</th><th>9</th>
                <th>R</th><th>H</th><th>E</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Got The Runs</td>
                <td>2</td><td>2</td><td>1</td><td>0</td><td>2</td>
                <td>0</td><td>0</td><td>3</td><td>0</td>
                <td>10</td><td>12</td><td>0</td>
              </tr>
              <tr>
                <td>Tee Ballers</td>
                <td>1</td><td>0</td><td>0</td><td>4</td><td>0</td>
                <td>0</td><td>3</td><td>0</td><td>0</td>
                <td>8</td><td>9</td><td>3</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  <% } %>

  <!-- pagination -->
  <nav class="mt-4">
    <ul class="pagination justify-content-center">
      <%
        for(int i=1;i<=totalPages;i++){
      %>
      <li class="page-item <%= (i == currentPage? "active":"") %>">
        <a class="page-link" href="?page=<%=i%>"><%= i %></a>
      </li>
      <%
        }
      %>
    </ul>
  </nav>
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

<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
