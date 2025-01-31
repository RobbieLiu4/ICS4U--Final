<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>League Calendar</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link 
      rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    >
    <link rel="stylesheet" href="styles.css">
    <style>
      .calendar-container {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 1.5rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }
      .calendar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1.5rem;
      }
      .calendar-grid {
        display: grid;
        gap: 1rem;
      }
      .day-cell {
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 0.5rem;
        min-height: 100px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: space-between;
        cursor: pointer;
        transition: background-color 0.3s;
      }
      .day-cell:hover {
        background-color: #f0f8ff;
      }
      .day-cell h6 {
        margin: 0;
        font-size: 0.9rem;
      }
      .calendar-dropdown {
        width: auto;
      }
      .calendar-info {
        font-size: 0.85rem;
        color: #6c757d;
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

    <div class="container my-4">
      <h1 class="mb-4">League Calendar</h1>

      <div class="calendar-container">
        <%
          //server side approach: so that can read "month" param. from request, +default to current
          //for simplicity, placeholders:
          int currentMonth = 0; // january??? gotta pretend
          int currentYear = 2025;
          // can parse request param for ?month= or smth
          String monthParam = request.getParameter("month");
          String viewParam = request.getParameter("view");
          if(monthParam != null) {
            currentMonth = Integer.parseInt(monthParam);
          }
          if(viewParam == null) {
            viewParam = "month";
          }
        %>
        <div class="calendar-header">
          <!--formbased approach to switch b/w months  -->
          <form method="GET" style="margin:0; padding:0;">
            <input type="hidden" name="view" value="<%= viewParam %>"/>
            <input type="hidden" name="month" value="<%= (currentMonth - 1) %>"/>
            <button class="btn btn-primary" type="submit">Previous Month</button>
          </form>

          <div class="dropdown calendar-dropdown">
            <form method="GET" style="margin:0; padding:0;">
              <!-- // select for month or week, - small sample. -->
              <button
                class="btn btn-outline-primary dropdown-toggle"
                type="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <%= viewParam.equals("month") ? "Month View" : "Week View" %>
              </button>
              <ul class="dropdown-menu">
                <li>
                  <a class="dropdown-item" href="?view=month&month=<%=currentMonth%>">
                    Month View
                  </a>
                </li>
                <li>
                  <a class="dropdown-item" href="?view=week&month=<%=currentMonth%>">
                    Week View
                  </a>
                </li>
              </ul>
            </form>
          </div>

          <form method="GET" style="margin:0; padding:0;">
            <input type="hidden" name="view" value="<%= viewParam %>"/>
            <input type="hidden" name="month" value="<%= (currentMonth + 1) %>"/>
            <button class="btn btn-primary" type="submit">Next Month</button>
          </form>
        </div>

        <div class="calendar-grid" style="<%= viewParam.equals("month") ? "grid-template-columns: repeat(7, 1fr);" : "grid-template-columns: repeat(7, 1fr);" %>">
          <%
            //just  30 or 7 days
            int cellsToRender = viewParam.equals("month") ? 30 : 7;
            for(int i=1; i<=cellsToRender; i++){
          %>
            <div class="day-cell">
              <h6><%= i %></h6>
              <p>Event Details Here</p>
            </div>
          <%
            }
          %>
        </div>

        <div class="calendar-info mt-3">
          <%
            if(viewParam.equals("month")){
          %>
            Click on a day to view detailed events for that day or the next 3 days.
          <%
            } else {
          %>
            Week view. Click on a day to view events for that day or 3-day span.
          <%
            }
          %>
        </div>
      </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
      <div class="container">
        <p class="mb-1">
          &copy; <span id="year"><%
            Calendar c = Calendar.getInstance();
            out.print(c.get(Calendar.YEAR));
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
