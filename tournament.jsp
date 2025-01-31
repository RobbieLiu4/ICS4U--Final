<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>16-Team Tournament Bracket</title>
    <!-- bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- bootstrap icons -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="styles.css">
    <style>
      body {
        background-color: #f8f9fa;
      }
      .tournament {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 20px;
        padding: 20px;
        overflow-x: auto;
      }
      .round {
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: center;
        gap: 80px; 
        min-height: 100%;
      }
      .match {
        position: relative;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 10px;
        text-align: center;
        width: 180px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }
      .team {
        font-weight: bold;
        margin: 5px 0;
        padding: 5px;
        border-radius: 5px;
        display: flex;
        justify-content: space-between;
      }
      .team.winner {
        background-color: #d4edda;
        border: 1px solid #c3e6cb;
      }
      .score {
        font-weight: normal;
        color: #555;
        margin-left: 5px;
      }
      .connector {
        position: absolute;
        background-color: #ddd;
      }
      .connector.vertical {
        width: 2px;
        height: 100%;
      }
      .connector.horizontal {
        height: 2px;
        width: 100%;
      }
      .connector-left {
        right: 100%;
        top: 50%;
        transform: translateY(-50%);
      }
      .connector-right {
        left: 100%;
        top: 50%;
        transform: translateY(-50%);
      }
    </style>
  </head>
  <body>
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
    <div class="container">
      <h1 class="text-center my-4">End-Of-Season Tournament Bracket</h1>

      <div class="tournament">
        <!--round 1 -->
        <div class="round">
          <div class="match">
            <div class="team">Team 1<span class="score">45</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 16<span class="score">30</span></div>
          </div>
          <div class="match">
            <div class="team">Team 8<span class="score">50</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 9<span class="score">32</span></div>
          </div>
          <div class="match">
            <div class="team">Team 4<span class="score">55</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 13<span class="score">40</span></div>
          </div>
          <div class="match">
            <div class="team">Team 5<span class="score">48</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 12<span class="score">44</span></div>
          </div>
          <div class="match">
            <div class="team">Team 2<span class="score">49</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 15<span class="score">38</span></div>
          </div>
          <div class="match">
            <div class="team">Team 7<span class="score">53</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 10<span class="score">47</span></div>
          </div>
          <div class="match">
            <div class="team">Team 3<span class="score">60</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 14<span class="score">29</span></div>
          </div>
          <div class="match">
            <div class="team">Team 6<span class="score">51</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team">Team 11<span class="score">50</span></div>
          </div>
        </div>

        <!-- round 2 -->
        <div class="round">
          <div class="match">
            <div class="team winner">Winner Match 1<span class="score">47</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team winner">Winner Match 2<span class="score">42</span></div>
          </div>
          <div class="match">
            <div class="team winner">Winner Match 3<span class="score">55</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team winner">Winner Match 4<span class="score">49</span></div>
          </div>
          <div class="match">
            <div class="team winner">Winner Match 5<span class="score">45</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team winner">Winner Match 6<span class="score">51</span></div>
          </div>
          <div class="match">
            <div class="team winner">Winner Match 7<span class="score">52</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team winner">Winner Match 8<span class="score">44</span></div>
          </div>
        </div>

        <!-- semis -->
        <div class="round">
          <div class="match">
            <div class="team winner">Winner QF 1<span class="score">48</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team winner">Winner QF 2<span class="score">46</span></div>
          </div>
          <div class="match">
            <div class="team winner">Winner QF 3<span class="score">55</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team winner">Winner QF 4<span class="score">52</span></div>
          </div>
        </div>

        <!-- Finals -->
        <div class="round">
          <div class="match">
            <div class="team winner">Winner SF 1<span class="score">54</span></div>
            <div class="connector vertical connector-right"></div>
            <div class="team winner">Winner SF 2<span class="score">51</span></div>
          </div>
        </div>

        <!-- champion -->
        <div class="round">
          <div class="match">
            <div class="team winner">Champion</div>
          </div>
        </div>
      </div>
    </div>

    <!-- footer-->
    <footer class="bg-dark text-white text-center py-3 mt-5">
      <div class="container">
        <p class="mb-1">
          &copy; <span id="year"><%
            out.print(Calendar.getInstance().get(Calendar.YEAR));
          %></span> South Ottawa Softball. All Rights Reserved.
        </p>
        <p>
          <a href="privacy.html" class="text-light text-decoration-none mx-2"
            >Privacy Policy</a>
          <a href="terms.html" class="text-light text-decoration-none mx-2"
            >Terms of Service</a>
        </p>
      </div>
    </footer>

    <script>
    //
      document.getElementById("year").textContent = new Date().getFullYear();
    </script>
  </body>
</html>
