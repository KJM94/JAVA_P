<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty property="bbsTitle" name="bbs"/>
<jsp:setProperty property="bbsContent" name="bbs"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(!userID.equals("kjmin0807")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('사용 권한이 없습니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	} else{
		
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목과 내용을 모두 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		 
		}
		}
	}
		
	%>

</body>
</html>