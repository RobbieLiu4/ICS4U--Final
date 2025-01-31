<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Team Finder</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!-- bootstrap CSS -->
  <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
  />
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
    .team-info {
      margin-top: 1rem;
    }
    .player-list .card {
      margin-bottom: 1rem;
    }
    .availability-section {
      margin-top: 1rem;
      background: #e7f5ff;
      padding: 1rem;
      border-radius: 5px;
    }
    .availability-section h5 {
      margin-bottom: 1rem;
    }
    .no-team-selected {
      color: #6c757d;
      font-size: 1.2rem;
      margin-top: 1rem;
    }
    .available-player {
      background-color: #d4edda !important;
      border: 1px solid #c3e6cb !important;
    }
    .available-count {
      color: #28a745;
      font-weight: bold;
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

<%

  // Simulate "logged in" data
 
  boolean isLoggedIn = true;
  String loggedInUser = "Emily Davis";

  //our teams data 
//explanations:
  // e/ team is a Map<String,Object> w/ keys: name, nextGame, roster (list of players)
  //e/ player is a Map<String,Object> w/ keys: name (string) and available (boole)

  List<Map<String,Object>> teams = new ArrayList<>();

  {
    //"Got The Runs"
    Map<String,Object> team1 = new HashMap<>();
    team1.put("name", "Got The Runs");
    team1.put("nextGame", "Saturday, 4 PM @ Calzavara Park");

    List<Map<String,Object>> roster1 = new ArrayList<>();
    roster1.add(new HashMap<String,Object>() {{ put("name", "Emily Davis");    put("available", true); }});
    roster1.add(new HashMap<String,Object>() {{ put("name", "John Doe");       put("available", false); }});
    roster1.add(new HashMap<String,Object>() {{ put("name", "Sarah Johnson");  put("available", true); }});
    roster1.add(new HashMap<String,Object>() {{ put("name", "Mark Taylor");    put("available", false); }});
    team1.put("roster", roster1);

    // "Raccoons"
    Map<String,Object> team2 = new HashMap<>();
    team2.put("name", "Raccoons");
    team2.put("nextGame", "Sunday, 2 PM @ Windsor Park");

    List<Map<String,Object>> roster2 = new ArrayList<>();
    roster2.add(new HashMap<String,Object>() {{ put("name", "Liam Walker");  put("available", true); }});
    roster2.add(new HashMap<String,Object>() {{ put("name", "Mike Brown");   put("available", false); }});
    roster2.add(new HashMap<String,Object>() {{ put("name", "Lucy Adams");   put("available", true); }});
    roster2.add(new HashMap<String,Object>() {{ put("name", "Jane Smith");   put("available", false); }});
    team2.put("roster", roster2);

    teams.add(team1);
    teams.add(team2);
  }


  //check if user selected a team
  // so-- read from "selectedTeam" param
 
  String selectedTeamName = request.getParameter("selectedTeam");

  Map<String,Object> selectedTeam = null;
  if (selectedTeamName != null && !selectedTeamName.trim().isEmpty()) {
    //find matching team
    for (Map<String,Object> t : teams) {
      String tName = (String)t.get("name");
      if (tName.equals(selectedTeamName)) {
        selectedTeam = t;
        break;
      }
    }
  }
%>

<!-- team finder sect. -->
<div class="container my-4">
  <h1>Team Finder</h1>
  <p>Select a team to view its roster. If you're logged in and on that team's roster, you can set your availability for the next game.</p>

  <!-- submit the form on change so re-render the page w/ chosen team -->
  <form method="get" action="team-finder.jsp">
    <div class="mb-3">
      <label for="teamSelect" class="form-label">Choose a Team:</label>
      <select 
        id="teamSelect" 
        name="selectedTeam" 
        class="form-select" 
        onchange="this.form.submit()"
      >
        <option value="" disabled 
          <%= (selectedTeamName == null || selectedTeamName.isEmpty()) ? "selected" : "" %>>
          Select a team
        </option>
        <%
          for (Map<String,Object> t : teams) {
            String tName = (String)t.get("name");
        %>
          <option value="<%= tName %>" 
            <%= (tName.equals(selectedTeamName)) ? "selected" : "" %>>
            <%= tName %>
          </option>
        <%
          }
        %>
      </select>
    </div>
  </form>

  <div id="teamInfo" class="team-info">
    <%
      //if user didn't selected a team or no match found
      if (selectedTeam == null) {
    %>
      <p class="no-team-selected" id="noTeamSelected">No team selected.</p>
    <%
      } else {
        //show team's info
        String nextGame  = (String)selectedTeam.get("nextGame");
        List<Map<String,Object>> roster = (List<Map<String,Object>>)selectedTeam.get("roster");

        //how many r available
        int availableCount = 0;
        for (Map<String,Object> p : roster) {
          boolean avail = (boolean)p.get("available");
          if (avail) { availableCount++; }
        }
    %>
      <p>
        <strong>Next Game:</strong> <%= nextGame %>
        <span class="available-count">(Available: <%= availableCount %>)</span>
      </p>

      <!-- Roster accordion -->
      <div class="accordion" id="rosterAccordion">
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingRoster">
            <button 
              class="accordion-button collapsed" 
              type="button" 
              data-bs-toggle="collapse" 
              data-bs-target="#collapseRoster" 
              aria-expanded="false" 
              aria-controls="collapseRoster"
            >
              Roster
            </button>
          </h2>
          <div 
            id="collapseRoster" 
            class="accordion-collapse collapse" 
            aria-labelledby="headingRoster" 
            data-bs-parent="#rosterAccordion"
          >
            <div class="accordion-body player-list">
              <%
                //display e/ player
                for (Map<String,Object> player : roster) {
                  String playerName = (String)player.get("name");
                  boolean avail = (boolean)player.get("available");
              %>
                <div class="card <%= avail ? "available-player" : "" %>">
                  <div class="card-body d-flex justify-content-between align-items-center">
                    <span><%= playerName %></span>
                  </div>
                </div>
              <%
                }
              %>
            </div>
          </div>
        </div>
      </div>

      <%
        //check if  loggedInUser is on  roster
        Map<String,Object> userOnTeam = null;
        for (Map<String,Object> p : roster) {
          String pname = (String)p.get("name");
          if (pname.equals(loggedInUser)) {
            userOnTeam = p;
            break;
          }
        }

        if (isLoggedIn && userOnTeam != null) {
      %>
        <div class="availability-section">
          <h5>Set Your Availability</h5>
          <p>
            You are on the roster for <strong><%= selectedTeam.get("name") %></strong>. 
            Let your teammates know if you can make the next game!
          </p>
          <p>
            <strong>Currently:</strong> 
            <%= ((boolean)userOnTeam.get("available")) ? "Available" : "Not available" %>
          </p>
        </div>
      <%
        }
      %>
    <%
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
