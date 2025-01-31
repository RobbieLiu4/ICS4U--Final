<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Standings and Leaderboard</title>
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
      .nav-tabs .nav-link {
        cursor: pointer;
      }
      .filter-container {
        margin-bottom: 1rem;
      }
      .d-none {
        display: none !important;
      }
    </style>
  </head>
  <body class="bg-light">
    <!-- top dark bar -->
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

    <!-- main nav -->
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
      <h1 class="mb-4 text-center">Standings &amp; Leaderboard</h1>

      <!-- nav. tabs -->
      <%
        //handle which tab's active via request param.
        String activeTab = request.getParameter("tab");
        if(activeTab == null) activeTab = "standings";
      %>
      <ul class="nav nav-tabs mb-4" id="mainTabs">
        <li class="nav-item">
          <a
            class="nav-link <%= ("standings".equals(activeTab)? "active":"") %>"
            href="?tab=standings"
          >
            Standings
          </a>
        </li>
        <li class="nav-item">
          <a
            class="nav-link <%= ("leaderboard".equals(activeTab)? "active":"") %>"
            href="?tab=leaderboard"
          >
            Leaderboard
          </a>
        </li>
      </ul>

      <div class="tab-content">
        <!--standings tab -->
        <div
          class="tab-pane fade <%= ("standings".equals(activeTab)? "show active":"") %>"
          id="standingsTab"
          style="<%= ("standings".equals(activeTab)? "":"display:none;") %>"
        >
          <h3 class="text-center mb-4">Standings</h3>
          <!--to toggle buttons for division or league -->
          <%
            String stgView = request.getParameter("stgView");
            if(stgView == null) stgView="division";
          %>
          <div class="text-center mb-4">
            <a href="?tab=standings&stgView=division" class="btn <%= (stgView.equals("division")?"btn-primary":"btn-outline-primary") %> me-2">
              Division
            </a>
            <a href="?tab=standings&stgView=league" class="btn <%= (stgView.equals("league")?"btn-primary":"btn-outline-primary") %>">
              League
            </a>
          </div>

          <% if("division".equals(stgView)){ %>
            <h4>Southside Division</h4>
            <table class="table table-bordered table-hover mb-4">
              <thead class="table-light">
                <tr>
                  <th>Team</th>
                  <th>Record</th>
                  <th>Win %</th>
                  <th>GB</th>
                  <th>Home</th>
                  <th>Away</th>
                  <th>RF</th>
                  <th>RA</th>
                  <th>Last 10</th>
                  <th>Streak</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Got The Runs</td>
                  <td>10-2</td>
                  <td>.833</td>
                  <td>0.0</td>
                  <td>6-1</td>
                  <td>4-1</td>
                  <td>87</td>
                  <td>45</td>
                  <td>8-2</td>
                  <td>W3</td>
                </tr>
                <tr>
                  <td>Raccoons</td>
                  <td>8-4</td>
                  <td>.667</td>
                  <td>2.0</td>
                  <td>5-2</td>
                  <td>3-2</td>
                  <td>78</td>
                  <td>62</td>
                  <td>6-4</td>
                  <td>W1</td>
                </tr>
              </tbody>
            </table>
          <% } else { %>
            <h4>League Standings</h4>
            <table class="table table-bordered table-hover">
              <thead class="table-light">
                <tr>
                  <th>Team</th>
                  <th>Record</th>
                  <th>Win %</th>
                  <th>Points</th>
                  <th>RF</th>
                  <th>RA</th>
                  <th>Streak</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Got The Runs</td>
                  <td>10-2</td>
                  <td>.833</td>
                  <td>30</td>
                  <td>87</td>
                  <td>45</td>
                  <td>W3</td>
                </tr>
                <tr>
                  <td>Raccoons</td>
                  <td>8-4</td>
                  <td>.667</td>
                  <td>24</td>
                  <td>78</td>
                  <td>62</td>
                  <td>W1</td>
                </tr>
                <tr>
                  <td>Tee Ballers</td>
                  <td>7-5</td>
                  <td>.583</td>
                  <td>21</td>
                  <td>65</td>
                  <td>70</td>
                  <td>L1</td>
                </tr>
              </tbody>
            </table>
          <% } %>
        </div>

        <!-- leaderboard tab -->
        <div
          class="tab-pane fade <%= ("leaderboard".equals(activeTab)? "show active":"") %>"
          id="leaderboardTab"
          style="<%= ("leaderboard".equals(activeTab)? "":"display:none;") %>"
        >
          <h3 class="text-center mb-4">Leaderboard</h3>
          <div class="filter-container">
            <!-- param . -->
            <%
              String lbFilter = request.getParameter("lbFilter");
              if(lbFilter == null) lbFilter="team-wins";
            %>
            <form method="GET" action="">
              <input type="hidden" name="tab" value="leaderboard" />
              <label for="filterLeaderboard" class="form-label">Filter By:</label>
              <select id="filterLeaderboard" name="lbFilter" class="form-select" onchange="this.form.submit()">
                <option value="team-wins" <%= (lbFilter.equals("team-wins")?"selected":"") %>>Team Wins</option>
                <option value="player-points" <%= (lbFilter.equals("player-points")?"selected":"") %>>Player Points</option>
                <option value="home-runs" <%= (lbFilter.equals("home-runs")?"selected":"") %>>Home Run Leaders</option>
                <option value="batting-average" <%= (lbFilter.equals("batting-average")?"selected":"") %>>Batting Average</option>
                <option value="strikeouts" <%= (lbFilter.equals("strikeouts")?"selected":"") %>>Pitching Strikeouts</option>
              </select>
            </form>
          </div>
          <table class="table table-bordered table-hover">
            <thead id="leaderboardTableHead">
              <%
                if(lbFilter.equals("team-wins")){
              %>
                <tr><th>Rank</th><th>Team</th><th>Stat</th></tr>
              <%
                } else {
              %>
                <tr><th>Rank</th><th>Name</th><th>Team</th><th>Stat</th></tr>
              <%
                }
              %>
            </thead>
            <tbody id="leaderboardContent">
              <%
                //store sample data:
                if(lbFilter.equals("team-wins")){
              %>
                <tr>
                  <td>1</td><td>Got The Runs</td><td>12 Wins</td>
                </tr>
                <tr>
                  <td>2</td><td>Raccoons</td><td>10 Wins</td>
                </tr>
                <tr>
                  <td>3</td><td>Tee Ballers</td><td>8 Wins</td>
                </tr>
              <%
                } else if(lbFilter.equals("player-points")){
              %>
                <tr>
                  <td>1</td><td>Mark Taylor</td><td>Brew Jays</td><td>125 Points</td>
                </tr>
                <tr>
                  <td>2</td><td>Emily Davis</td><td>Raccoons</td><td>110 Points</td>
                </tr>
                <tr>
                  <td>3</td><td>James Carter</td><td>Tee Ballers</td><td>105 Points</td>
                </tr>
              <%
                } else if(lbFilter.equals("home-runs")){
              %>
                <tr>
                  <td>1</td><td>Sarah Johnson</td><td>Got The Runs</td><td>8 Home Runs</td>
                </tr>
                <tr>
                  <td>2</td><td>Mike Brown</td><td>Wildcards</td><td>7 Home Runs</td>
                </tr>
                <tr>
                  <td>3</td><td>Liam Walker</td><td>Raccoons</td><td>6 Home Runs</td>
                </tr>
              <%
                } else if(lbFilter.equals("batting-average")){
              %>
                <tr>
                  <td>1</td><td>James Carter</td><td>Tee Ballers</td><td>.455</td>
                </tr>
                <tr>
                  <td>2</td><td>Sarah Johnson</td><td>Got The Runs</td><td>.440</td>
                </tr>
                <tr>
                  <td>3</td><td>Emily Davis</td><td>Brew Jays</td><td>.430</td>
                </tr>
              <%
                } else {
              %>
                <tr>
                  <td>1</td><td>Mike Wilson</td><td>Brew Jays</td><td>45 Strikeouts</td>
                </tr>
                <tr>
                  <td>2</td><td>Liam Walker</td><td>Got The Runs</td><td>40 Strikeouts</td>
                </tr>
                <tr>
                  <td>3</td><td>Emily Davis</td><td>Raccoons</td><td>38 Strikeouts</td>
                </tr>
              <%
                }
              %>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
      <div class="container">
        <p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
