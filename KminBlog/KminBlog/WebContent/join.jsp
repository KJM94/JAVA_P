<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Kmin Blog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          
              <li class="nav-item active">
            <a class="nav-link" href="login.jsp">Login
              <span class="sr-only">(current)</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
		<br>
		<br>

        <div class="card mb-4" style="margin:auto; width:500px;">
          
          <div class="card-body">
            <form method="post" action="joinAction.jsp">
    				<h3 style="text-align: center;">회원가입</h3>
    				<div class="form-group">
    					<input style = "text-align:center;" type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
    				</div>
    				<div class="form-group">
    					<input style = "text-align:center;" type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
    				</div>
    				
    				<div class="form-group">
    					<input style = "text-align:center;" type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
    				</div>
    				
    				<div class="form-group">
    					<input style = "text-align:center;" type="text" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
    				</div>
    				<input type="submit" class="btn btn-primary form-control" value="회원가입">
    			</form>
          </div>
        </div>
     

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>