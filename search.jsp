<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Search</title>
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
    body {
      background-color: #f8f9fa;
    }
    .search-results {
      margin-top: 1rem;
    }
    .result-item {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 1rem;
      margin-bottom: 1rem;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .result-item a {
      text-decoration: none;
      color: #0d6efd;
    }
    .result-item a:hover {
      text-decoration: underline;
    }
    .no-results {
      color: #6c757d;
      font-size: 1.2rem;
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

<!-- search Section -->
<div class="container my-4">
  <h1>Search</h1>
  <!-- keep the form simple-->
  <form method="get" action="search.jsp">
    <div class="mb-3">
      <input
        type="text"
        class="form-control"
        name="searchQuery"
        placeholder="Search for posts, users, or other content..."
        required
      >
    </div>
    <button type="submit" class="btn btn-primary">Search</button>
  </form>

  <% 
    //sample data
    List<Map<String, String>> sampleData = new ArrayList<>();
    {
      Map<String, String> item1 = new HashMap<>();
      item1.put("id", "1");
      item1.put("type", "post");
      item1.put("content", "What a great game yesterday!");
      item1.put("author", "John Doe");
      item1.put("link", "/posts/1");
      sampleData.add(item1);

      Map<String, String> item2 = new HashMap<>();
      item2.put("id", "2");
      item2.put("type", "post");
      item2.put("content", "Check out this awesome photo!");
      item2.put("author", "Emily Davis");
      item2.put("link", "/posts/2");
      sampleData.add(item2);

      Map<String, String> item3 = new HashMap<>();
      item3.put("id", "3");
      item3.put("type", "user");
      item3.put("content", "Emily Davis");
      item3.put("author", "");
      item3.put("link", "/users/3");
      sampleData.add(item3);

      Map<String, String> item4 = new HashMap<>();
      item4.put("id", "4");
      item4.put("type", "user");
      item4.put("content", "Mark Taylor");
      item4.put("author", "");
      item4.put("link", "/users/4");
      sampleData.add(item4);

      Map<String, String> item5 = new HashMap<>();
      item5.put("id", "5");
      item5.put("type", "post");
      item5.put("content", "Who’s ready for the playoffs?");
      item5.put("author", "Sarah Johnson");
      item5.put("link", "/posts/5");
      sampleData.add(item5);
    }

    // handle the search logic 
    String searchQuery = request.getParameter("searchQuery");
    List<Map<String, String>> results = new ArrayList<>();

    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
      String q = searchQuery.toLowerCase();
      for (Map<String, String> item : sampleData) {
        String content = item.get("content").toLowerCase();
        String author  = item.get("author").toLowerCase();
        if (content.contains(q) || author.contains(q)) {
          results.add(item);
        }
      }
    }
  %>

  <div id="searchResults" class="search-results">
    <%
      //if query was made but there are no results
      if (searchQuery != null && !searchQuery.trim().isEmpty() && results.isEmpty()) {
    %>
      <p class="no-results">No results found.</p>
    <%
      } else {
        //otherwise, display matching results
        for (Map<String, String> item : results) {
    %>
      <div class="result-item">
        <p><strong>Type:</strong> <%= item.get("type") %></p>
        <p>
          <strong>Content:</strong> 
          <a href="<%= item.get("link") %>">
            <%= item.get("content") %>
          </a>
        </p>
        <%
          if (item.get("author") != null && !item.get("author").isEmpty()) {
        %>
          <p><strong>Author:</strong> <%= item.get("author") %></p>
        <%
          }
        %>
      </div>
    <%
        }
      }
    %>
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

<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
