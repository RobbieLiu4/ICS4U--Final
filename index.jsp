<%@ page import="java.util.*,java.io.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>South Ottawa Softball</title>
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
    />
    <link rel="stylesheet" href="styles.css">
    <style>
      .player-spotlight {
        background: linear-gradient(135deg, #ffeb3b, #ffc107);
        border-radius: 12px;
        padding: 2rem;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin-top: 2rem;
      }
      .player-photo {
        width: 150px;
        height: 150px; /* images square */
        border-radius: 50%; /*circle style */
        border: 4px solid #fff;
        margin-bottom: 1rem;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        object-fit: cover;
      }
      .player-spotlight h3 {
        font-size: 1.75rem;
        margin-bottom: 1rem;
        font-weight: bold;
      }
      .player-spotlight p {
        margin: 0.5rem 0;
        font-size: 1rem;
      }
      .carousel-item img {
        max-height: 400px;
        object-fit: cover;
      }
      .carousel-caption {
        background-color: rgba(0, 0, 0, 0.45);
        border-radius: 0.5rem;
        padding: 1rem;
      }
      .events-section {
        background-color: #fff9e6;
        padding: 1rem;
        border-radius: 8px;
        margin-top: 2rem;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      }
      .hr-leaderboard {
        background-color: #f8f9fa;
        padding: 1rem;
        border-radius: 8px;
        margin-top: 2rem;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      }
      .hr-leaderboard table tr th,
      .hr-leaderboard table tr td {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <!-- // top dark bar -->
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

    <!-- // main nav -->
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
      <div class="text-center">
        <img
          src="https://cdn.glitch.global/1dc13e00-e04f-48b4-b6e2-ec47e56bd016/SOS_Ball.jpg?v=1737390285570"
          alt="Softball League Logo"
          class="d-block mx-auto img-fluid"
          style="max-width: 600px"
        />
      </div>

      <!-- player spotlight -->
      <div class="player-spotlight">
        
        <img
          src="https://cdn.glitch.global/1dc13e00-e04f-48b4-b6e2-ec47e56bd016/softballllll%20pic.jpg?v=1737510915196"
          alt="Player of the Week"
          class="player-photo"
        />
        <h3>Player Spotlight: Sarah Johnson</h3>
        <p><strong>Team:</strong> Boomtown Bats</p>
        <p><strong>Stats:</strong> 10 RBIs, 5 Home Runs, .450 Avg</p>
        <p>
          Sarah has been a star this week, showcasing her incredible batting
          skills and contributing to her team's success.
        </p>
      </div>

      <!-- news carousel,--  js to cycle images -->
      <div
        id="newsCarousel"
        class="carousel slide carousel-fade mt-5"
        data-bs-ride="carousel"
        data-bs-interval="4000"
        data-bs-pause="hover"
      >
        <div class="carousel-indicators">
          <button
            type="button"
            data-bs-target="#newsCarousel"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Slide 1"
          ></button>
          <button
            type="button"
            data-bs-target="#newsCarousel"
            data-bs-slide-to="1"
            aria-label="Slide 2"
          ></button>
          <button
            type="button"
            data-bs-target="#newsCarousel"
            data-bs-slide-to="2"
            aria-label="Slide 3"
          ></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="https://cdn.glitch.global/1dc13e00-e04f-48b4-b6e2-ec47e56bd016/softball%20casual%20photoo.jpg?v=1737469810039"
              class="d-block w-100"
              alt="News 1"
            />
            <div class="carousel-caption d-none d-md-block">
              <h5>News Headline 1</h5>
              <p>Big updates about the league's upcoming season!</p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="https://cdn.glitch.global/1dc13e00-e04f-48b4-b6e2-ec47e56bd016/softball%20low%20brightness.jpg?v=1737527718249"
              class="d-block w-100"
              alt="News 2"
            />
            <div class="carousel-caption d-none d-md-block">
              <h5>News Headline 2</h5>
              <p>Check out this week's highlights and top plays.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="https://cdn.glitch.global/1dc13e00-e04f-48b4-b6e2-ec47e56bd016/softball%20medium%20brightnesss.jpg?v=1737527715308"
              class="d-block w-100"
              alt="News 3"
            />
            <div class="carousel-caption d-none d-md-block">
              <h5>News Headline 3</h5>
              <p>New teams joining the league—get all the details here.</p>
            </div>
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#newsCarousel"
          data-bs-slide="prev"
        >
          <span
            class="carousel-control-prev-icon"
            aria-hidden="true"
          ></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#newsCarousel"
          data-bs-slide="next"
        >
          <span
            class="carousel-control-next-icon"
            aria-hidden="true"
          ></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <!-- upcoming events -->
      <div class="events-section mt-5">
        <h3 class="mb-4">Upcoming Events</h3>
        <div class="row g-3">
          <div class="col-md-4">
            <div class="card text-center h-100">
              <div class="card-body">
                <h5 class="card-title">Wednesday Event</h5>
                <p class="card-text">
                  Brew Jays vs Tee Ballers @ Calzavara Park - 6:00 PM
                </p>
              </div>
              <div class="card-footer">
                <i class="bi bi-calendar-event"></i> Wednesday
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-center h-100">
              <div class="card-body">
                <h5 class="card-title">Exhibition Match</h5>
                <p class="card-text">Starts at 6:00 PM—Don't miss it!</p>
              </div>
              <div class="card-footer">
                <i class="bi bi-calendar-event"></i> Thursday
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-center h-100">
              <div class="card-body">
                <h5 class="card-title">Off Day</h5>
                <p class="card-text">No scheduled events—enjoy the break!</p>
              </div>
              <div class="card-footer">
                <i class="bi bi-calendar-event"></i> Friday
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- home run Leaderboard -->
      <div class="hr-leaderboard mt-5">
        <h3 class="mb-4">Home Run Leaderboard</h3>
        <table class="table table-bordered">
          <thead class="table-light">
            <tr>
              <th>Rank</th>
              <th>Player</th>
              <th>Team</th>
              <th>HR</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Sarah Johnson</td>
              <td>Boomtown Bats</td>
              <td>5</td>
            </tr>
            <tr>
              <td>2</td>
              <td>John Doe</td>
              <td>Got The Runs</td>
              <td>4</td>
            </tr>
            <tr>
              <td>3</td>
              <td>Emily Davis</td>
              <td>Raccoons</td>
              <td>3</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
      <div class="container">
        <p class="mb-1">
          &copy; <span id="year"><%
            // //setting year 
            Calendar cal = Calendar.getInstance();
            int y = cal.get(Calendar.YEAR);
            out.print(y);
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  </body>
</html>
