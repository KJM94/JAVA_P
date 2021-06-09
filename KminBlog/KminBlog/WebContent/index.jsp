<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Kmin Blog</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

</head>

<body>
<%
	String userID = null;
		  if (session.getAttribute("userID")!= null){
			  userID = (String) session.getAttribute("userID");
		  }
		  int pageNumber = 1;
		  if(request.getParameter("pageNumber") != null){
			  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		  }
%>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Kmin Blog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          
              <%
              	if(userID == null){
              %>
              <li class="nav-item active">
            <a class="nav-link" href="login.jsp">Login
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="join.jsp">signUp
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <%
              	} else{
          %>
          <li class="nav-item active">
            <a class="nav-link" href="logoutAction.jsp">Logout
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <%
              	}
          %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container" style="height: 850px;">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">
		<br>
		<br>

        <!-- Blog Post -->
        <%
        	BbsDAO bbsDAO = new BbsDAO();
        	ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
        	for (int i=0; i<list.size(); i++){
        %>
        <div class="card mb-4">
          
          <div class="card-body">
            <h2 class="card-title"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;").replaceAll("\n", "<br>") %></h2>
            <%
            	if (userID != null){
            %>
            <a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>" class="btn btn-primary">Read More &rarr;</a>
            <%
            	}
            %>
          </div>
          <div class="card-footer text-muted">
            <%= list.get(i).getBbsDate() %>
          </div>
        </div>
        <%
        	}
        %>

        <!-- Pagination -->
        <%
        	if(pageNumber != 1){
        %>
        	<a href="index.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn btn-primary btn-arraw-left">이전</a>
        <%
        	} if(bbsDAO.nextPage(pageNumber + 1)){
        %>
        	<a href="index.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-primary btn-arraw-left">다음</a>
        <%
        	}
        %>
      </div>
      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <br>


        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">주인장 소개</h5>
          <div class="card-body">
            햇병아리 개발자
            <br>
            kjmin0807@gmail.com<br>
            	깃허브 주소 : <a href="https://github.com/KJM94/KminBlog">https://github.com/KJM94/KminBlog</a>
          </div>
        </div>
        <%	
              	if(userID != null && userID.equals("kjmin0807")){
        	%>
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		<%
              	}
		%>
      </div>

    </div>
    <!-- /.row -->
	</div>
  
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>