<%@ page import="java.util.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Discussion</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- bootstrap css -->
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
    .post {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 1rem;
      margin-bottom: 1rem;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .post-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .post-author {
      font-weight: bold;
    }
    .post-timestamp {
      font-size: 0.85rem;
      color: #6c757d;
    }
    .post-content img {
      max-width: 100%;
      border-radius: 5px;
      margin-top: 0.5rem;
    }
    .like-comment-section {
      display: flex;
      gap: 1rem;
      margin-top: 0.5rem;
    }
    .like-comment-section button {
      background: none;
      border: none;
      cursor: pointer;
      color: #0d6efd;
    }
    .like-comment-section button:hover {
      text-decoration: underline;
    }
    .comment-list {
      margin-top: 1rem;
      padding-left: 1rem;
      border-left: 3px solid #eee;
    }
    .comment-item {
      margin-bottom: 0.75rem;
    }
    .comment-author {
      font-weight: 600;
    }
    .no-login-warning {
      color: #dc3545;
      font-weight: bold;
      margin-bottom: 1rem;
    }
  </style>
</head>
<body>
<!-- top bar -->
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

<!-- discussion container -->
<div class="container my-4">
  <h1>Discussion</h1>
  <%
    //session check for isLoggedIn
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if(isLoggedIn == null) {
      isLoggedIn = false;
    }
  %>
  <div id="postFormSection" class="mb-4">
    <%
      if(!isLoggedIn) {
    %>
      <div class="no-login-warning">
        You must be logged in to post!
      </div>
    <%
      } else {
    %>
      <!-- show post form if logged in -->
      <form method="POST" action="discussion.jsp">
        <div class="mb-3">
          <label for="postText" class="form-label">Create a post:</label>
          <textarea class="form-control" id="postText" name="postText" rows="3" placeholder="What's on your mind?"></textarea>
        </div>
        <div class="mb-3">
          <label for="postImage" class="form-label">Attach an image (optional):</label>
          <input class="form-control" type="file" id="postImage" name="postImage" accept="image/*">
        </div>
        <button type="submit" class="btn btn-primary">Post</button>
      </form>
    <%
      }
    %>
  </div>

  <%
    //storing posts in application context or something for sake of a demo
    // tbh not the best approach but oh well
    ServletContext sc = getServletContext();
    List<Map<String,Object>> posts = (List<Map<String,Object>>) sc.getAttribute("discussionPosts");
    if(posts == null) {
      posts = new ArrayList<>();
      //add some sample posts
      Map<String,Object> p1 = new HashMap<>();
      p1.put("author","John Doe");
      p1.put("content","What a great game yesterday!");
      p1.put("imageUrl",null);
      p1.put("timestamp",new Date(System.currentTimeMillis()-10L*24*60*60*1000)); //for -10 days ago
      p1.put("likes",2);
      p1.put("comments", new ArrayList<Map<String,String>>(){
        {
          Map<String,String> c1 = new HashMap<>();
          c1.put("author","Emily Davis");
          c1.put("text","Absolutely amazing!");
          add(c1);
          Map<String,String> c2 = new HashMap<>();
          c2.put("author","Mark Taylor");
          c2.put("text","Can't wait for the next one!");
          add(c2);
        }
      });
      posts.add(p1);

      Map<String,Object> p2 = new HashMap<>();
      p2.put("author","Sarah Johnson");
      p2.put("content","Check out this awesome photo from practice!");
      p2.put("imageUrl","https://via.placeholder.com/600x400");
      p2.put("timestamp",new Date(System.currentTimeMillis()-35L*24*60*60*1000)); // 35 days ago
      p2.put("likes",10);
      p2.put("comments", new ArrayList<Map<String,String>>());
      posts.add(p2);

      Map<String,Object> p3 = new HashMap<>();
      p3.put("author","Emily Davis");
      p3.put("content","Who’s ready for the playoffs?");
      p3.put("imageUrl",null);
      p3.put("timestamp", new Date());
      p3.put("likes",5);
      p3.put("comments", new ArrayList<Map<String,String>>());
      posts.add(p3);

      sc.setAttribute("discussionPosts", posts);
    }

    // handle post submission
    String postText = request.getParameter("postText");
    if(postText != null && isLoggedIn) {
      //create new post
      Map<String,Object> newPost = new HashMap<>();
      newPost.put("author","CurrentUser"); //or from session
      newPost.put("content", postText);
      newPost.put("imageUrl", null); // if wanna handle file upload, do so
      newPost.put("timestamp", new Date());
      newPost.put("likes", 0);
      newPost.put("comments", new ArrayList<Map<String,String>>());
      posts.add(0,newPost); // add to front
      sc.setAttribute("discussionPosts", posts);
    }

    //to filter out posts older than 30 days
    long now = System.currentTimeMillis();
    for(Iterator<Map<String,Object>> iter = posts.iterator(); iter.hasNext();) {
      Map<String,Object> postItem = iter.next();
      Date dt = (Date) postItem.get("timestamp");
      long diff = now - dt.getTime();
      long days = diff/(24L*60*60*1000);
      if(days > 30) {
        iter.remove(); //remove old post
      }
    }
  %>

  <div id="postsContainer">
    <%
      if(posts.isEmpty()) {
    %>
        <p>No posts to show.</p>
    <%
      } else {
        // render e/ post
        for(int i=0; i<posts.size(); i++){
          Map<String,Object> post = posts.get(i);
          String author = (String) post.get("author");
          String content = (String) post.get("content");
          String imageUrl = (String) post.get("imageUrl");
          Date timestamp = (Date) post.get("timestamp");
          int likes = (Integer) post.get("likes");
          List<Map<String,String>> comments = (List<Map<String,String>>) post.get("comments");
    %>
      <div class="post">
        <div class="post-header">
          <span class="post-author"><%= author %></span>
          <span class="post-timestamp"><%= timestamp.toString() %></span>
        </div>
        <div class="post-content">
          <p><%= content %></p>
          <%
            if(imageUrl != null && !imageUrl.isEmpty()) {
          %>
            <img src="<%= imageUrl %>" alt="Post Image">
          <%
            }
          %>
        </div>
        <div class="like-comment-section">
          <%
            //"like" only if logged in
            if(isLoggedIn) {
          %>
            <form method="POST" action="discussion.jsp">
              <input type="hidden" name="likeIndex" value="<%=i%>"/>
              <button type="submit" style="background:none;border:none;color:#0d6efd;cursor:pointer">
                Like (<%= likes %>)
              </button>
            </form>

            <form method="POST" action="discussion.jsp">
              <input type="hidden" name="commentIndex" value="<%=i%>"/>
              <button type="submit" style="background:none;border:none;color:#0d6efd;cursor:pointer">
                Comment (<%= comments.size() %>)
              </button>
            </form>
          <%
            } else {
          %>
            <button disabled>Like (<%= likes %>)</button>
            <button disabled>Comment (<%= comments.size() %>)</button>
          <%
            }
          %>
        </div>
        <div class="comment-list">
          <%
            for(Map<String,String> c: comments) {
          %>
            <div class="comment-item">
              <span class="comment-author"><%= c.get("author") %>:</span> <%= c.get("text") %>
            </div>
          <%
            }
          %>
        </div>
      </div>
    <%
        } //end for
      }
    %>
  </div>

  <%
    //to handle like
    String likeIndexParam = request.getParameter("likeIndex");
    if(likeIndexParam != null && isLoggedIn) {
      int idx = Integer.parseInt(likeIndexParam);
      if(idx >=0 && idx < posts.size()) {
        Map<String,Object> post = posts.get(idx);
        int currentLikes = (Integer) post.get("likes");
        post.put("likes", currentLikes + 1);
      }
      response.sendRedirect("discussion.jsp");
    }

    //handle comment
    String commentIndexParam = request.getParameter("commentIndex");
    if(commentIndexParam != null && isLoggedIn) {
      int idx = Integer.parseInt(commentIndexParam);
      if(idx >=0 && idx < posts.size()) {
        //prompt user ??? or  can do a text input
        //store a "commentText" param
        // For simplicity
        Map<String,Object> post = posts.get(idx);
        List<Map<String,String>> cList = (List<Map<String,String>>) post.get("comments");
        Map<String,String> newComment = new HashMap<>();
        newComment.put("author","CurrentUser");
        newComment.put("text","(Server-side comment placeholder) didn't build a form for that");
        cList.add(newComment);
      }
      response.sendRedirect("discussion.jsp");
    }
  %>
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
<!-- bootstrap js -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
