<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
  <br>
  <div class="card mb-4" style="margin:auto; width:800px;">
	<form method="post" action="writeAction.jsp">
      <table class="table table-striped" style="text-align: center: center; border: 1px solid #dddddd">
      	<thead>
      		<tr>
      			<th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기</th>
      		</tr>
      	</thead>
      	<tbody>
      		<tr>
      			<td><input type="text" class="form-control" placeholder="제목" name="bbsTitle" maxlength="50"></td>
      		</tr>
      			
      		<tr>
      			<td><textarea class="form-control" placeholder="내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
      		</tr>
      	</tbody>
      	
      </table>
      <center><a href="index.jsp" class="btn btn-primary">목록</a><input type="submit" class="btn btn-primary pull-right" value="글쓰기"></center>
	</form>
</div>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>