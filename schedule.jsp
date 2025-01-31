<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Schedule</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="styles.css">
    <style>
      .calendar-view {
        min-height: 300px;
        background-color: #f8f9fa;
        border-radius: 5px;
        padding: 2rem;
      }
      .week-tabs .nav-link {
        cursor: pointer;
      }
      .d-none {
        display: none !important;
      }
      .excel-hint {
        font-style: italic;
        color: #6c757d;
      }
    </style>
  </head>
  <body class="bg-light">
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
                <li>
                  <a class="dropdown-item" href="standings.jsp">Standings</a>
                </li>
                <li>
                  <a class="dropdown-item" href="tournament.jsp">Tournament</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="discussion.jsp">Discussion</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container my-4">
      <h1 class="mb-4">League Schedule</h1>
      <p class="excel-hint">
        Data for this schedule is designed to be integratable from an Excel file
        (list view). The calendar view below is simply a reference to the same
        data.
      </p>

      <!--  get form for  filters -->
      <form method="GET" action="schedule.jsp" class="row mb-3">
        <div class="col-md-3">
          <label for="filterDivision" class="form-label">Filter by Division</label>
          <select id="filterDivision" name="division" class="form-select">
            <option value="">All Divisions</option>
            <option value="southside">Southside Division</option>
            <option value="moose">Moose McGuire's Division</option>
          </select>
        </div>
        <div class="col-md-3">
          <label for="filterTeam" class="form-label">Filter by Team</label>
          <select id="filterTeam" name="team" class="form-select">
            <option value="">All Teams</option>
            <!-- southside -->
            <option value="got-the-runs">Got The Runs</option>
            <option value="raccoons">Raccoons</option>
            <option value="southside-scandal">Southside Scandal</option>
            <option value="tee-ballers">Tee Ballers</option>
            <option value="wildcards">Wildcards</option>
            <!-- moose -->
            <option value="boomtown-bats">Boomtown Bats</option>
            <option value="ball-crushers">Ball Crushers</option>
            <option value="brews-on-first">Brews on First</option>
            <option value="brew-jays">Brew Jays</option>
            <option value="no-stars">No Stars</option>
          </select>
        </div>
        <div class="col-md-3">
          <label for="filterLocation" class="form-label">Filter by Location</label>
          <select id="filterLocation" name="location" class="form-select">
            <option value="">All Locations</option>
            <option value="aladdin-park">Aladdin Park</option>
            <option value="windsor-park">Windsor Park</option>
            <option value="calzavara-park">Calzavara Park</option>
          </select>
        </div>
        <div class="col-md-3 d-flex align-items-end">
          <button type="submit" class="btn btn-primary">Apply Filters</button>
        </div>
      </form>
      <%
        // read request params
        String divisionFilter = request.getParameter("division");
        String teamFilter = request.getParameter("team");
        String locationFilter = request.getParameter("location");
        if(divisionFilter == null) divisionFilter = "";
        if(teamFilter == null) teamFilter = "";
        if(locationFilter == null) locationFilter = "";
        //storing schedule data in memory for now ig
       
        class Game {
          String date,time,division,homeTeam,awayTeam,location,score;
          String week;
          Game(String date,String time,String div,String h,String a,String loc,String sc,String wk) {
            this.date=date;this.time=time;this.division=div;this.homeTeam=h;this.awayTeam=a;this.location=loc;this.score=sc;this.week=wk;
          }
        }
        List<Game> allGames = new ArrayList<>();
        //js replicate all 
        allGames.add(new Game("2025-06-01","6:00 PM","southside","got-the-runs","raccoons","aladdin-park","7 - 5","week1"));
        allGames.add(new Game("2025-06-02","7:30 PM","moose","boomtown-bats","ball-crushers","windsor-park","3 - 3","week1"));
        allGames.add(new Game("2025-06-03","8:00 PM","southside","tee-ballers","wildcards","calzavara-park","4 - 6","week1"));

        allGames.add(new Game("2025-06-08","6:30 PM","southside","southside-scandal","raccoons","windsor-park","10 - 9","week2"));
        allGames.add(new Game("2025-06-09","7:00 PM","moose","brews-on-first","brew-jays","aladdin-park","2 - 2","week2"));
        allGames.add(new Game("2025-06-10","6:15 PM","moose","no-stars","boomtown-bats","calzavara-park","5 - 4","week2"));

        allGames.add(new Game("2025-06-15","7:00 PM","southside","got-the-runs","tee-ballers","aladdin-park","3 - 3","week3"));
        allGames.add(new Game("2025-06-16","8:00 PM","moose","ball-crushers","brews-on-first","windsor-park","1 - 2","week3"));
        allGames.add(new Game("2025-06-17","5:30 PM","southside","wildcards","southside-scandal","calzavara-park","8 - 10","week3"));

        //filter em
        List<Game> filtered = new ArrayList<>();
        for(Game g : allGames){
          boolean matches = true;
          if(!divisionFilter.isEmpty() && !g.division.equals(divisionFilter)) matches=false;
          if(!teamFilter.isEmpty()) {
            if(!g.homeTeam.equals(teamFilter) && !g.awayTeam.equals(teamFilter)) matches=false;
          }
          if(!locationFilter.isEmpty() && !g.location.equals(locationFilter)) matches=false;
          if(matches) filtered.add(g);
        }

        //see which week is active. 
        // by default--e.g. "week1"
        String activeWeek = request.getParameter("week");
        if(activeWeek == null) activeWeek = "week1";
      %>
      <!-- view toggle -->
      <ul class="nav nav-pills mb-4" id="viewToggle">
        <%
          String activeTab = request.getParameter("view");
          if(activeTab == null) activeTab = "list";
        %>
        <li class="nav-item">
          <a class="nav-link <%= ("list".equals(activeTab)? "active": "") %>" href="?view=list">
            List View
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= ("calendar".equals(activeTab)? "active": "") %>" href="?view=calendar">
            Calendar View
          </a>
        </li>
      </ul>

      <div class="tab-content">
        <!-- list view -->
        <div class="tab-pane fade <%= ("list".equals(activeTab)? "show active": "") %>" id="listView" style="<%= ("list".equals(activeTab) ? "" : "display:none;") %>">
          <!-- week tabs -->
          <ul class="nav nav-tabs week-tabs mb-3">
            <li class="nav-item">
              <a class="nav-link <%= (activeWeek.equals("week1") ? "active":"") %>" href="?view=list&week=week1&division=<%=divisionFilter%>&team=<%=teamFilter%>&location=<%=locationFilter%>">Week 1</a>
            </li>
            <li class="nav-item">
              <a class="nav-link <%= (activeWeek.equals("week2") ? "active":"") %>" href="?view=list&week=week2&division=<%=divisionFilter%>&team=<%=teamFilter%>&location=<%=locationFilter%>">Week 2</a>
            </li>
            <li class="nav-item">
              <a class="nav-link <%= (activeWeek.equals("week3") ? "active":"") %>" href="?view=list&week=week3&division=<%=divisionFilter%>&team=<%=teamFilter%>&location=<%=locationFilter%>">Week 3</a>
            </li>
          </ul>

          <!--display only the games that match the activeWeek. -->
          <table class="table table-bordered align-middle">
            <thead class="table-secondary">
              <tr>
                <th>Date</th>
                <th>Time</th>
                <th>Division</th>
                <th>Home Team</th>
                <th>Away Team</th>
                <th>Location</th>
                <th>Score (Home - Away)</th>
              </tr>
            </thead>
            <tbody>
            <%
              boolean anyRow = false;
              for(Game g : filtered){
                if(g.week.equals(activeWeek)){
                  anyRow=true;
            %>
              <tr>
                <td><%= g.date %></td>
                <td><%= g.time %></td>
                <td><%= (g.division.equals("southside") ? "Southside Division" : "Moose McGuire's Division") %></td>
                <td><%= g.homeTeam %></td>
                <td><%= g.awayTeam %></td>
                <td><%= g.location %></td>
                <td><%= g.score %></td>
              </tr>
            <%
                }
              }
              if(!anyRow){
            %>
              <tr><td colspan="7">No matches found for these filters in <%= activeWeek %></td></tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>

        <!-- cal view -->
        <div class="tab-pane fade <%= ("calendar".equals(activeTab)? "show active": "") %>" id="calendarView" style="<%= ("calendar".equals(activeTab) ? "" : "display:none;") %>">
          <div class="calendar-view">
            <h3 class="mb-4">Calendar View</h3>
            <p>
              <em>
                This calendar can reference the same schedule data as the list
                view above. For simplicity, the calendar integration is not
                shown here, but it would display the above fixtures in a visual
                calendar format.
              </em>
            </p>
          </div>
        </div>
      </div>
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
            >Privacy Policy</a
          >
          <a href="terms.html" class="text-light text-decoration-none mx-2"
            >Terms of Service</a
          >
        </p>
      </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
