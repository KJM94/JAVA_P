<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
		  if(userID == null){
			  PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인이 필요합니다.')");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
		  }
		  int bbsID = 0;
		  if(request.getParameter("bbsID") != null){
			  bbsID = Integer.parseInt(request.getParameter("bbsID"));
		  }
		  if (bbsID == 0){
			  PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 액션입니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
		  }
		  Bbs bbs = new BbsDAO().getBbs(bbsID);
		  if(!userID.equals(bbs.getUserID())){
			  PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
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
          
          
          <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
          <li class="nav-item active">
            <a class="nav-link" href="logoutAction.jsp">Logout
              <span class="sr-only">(current)</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <br>
  <div class="card mb-4" style="margin:auto; width:800px;">
	<form method="post" action="updateAction.jsp?bbsID=<%= bbsID%>">
      <table class="table table-striped" style="text-align: center: center; border: 1px solid #dddddd">
      	<thead>
      		<tr>
      			<th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기</th>
      		</tr>
      	</thead>
      	<tbody>
      		<tr>
      			<td><input type="text" class="form-control" placeholder="제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle()%>"></td>
      		</tr>
      			
      		<tr>
      			<td><textarea class="form-control" placeholder="내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
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