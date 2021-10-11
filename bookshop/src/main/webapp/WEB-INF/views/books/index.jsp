<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>Books</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron">
            <h1>Books INDEX</h1>
            <p>views/books/index.jsp</p>
        </div>
        <a href="<c:url value="/books/new" />"
            class="btn btn-lg btn-primary">도서 등록</a>
    
    
    
        
        <div class="row">
    		<c:forEach var="book" items="${books}" varStatus="status">
        		<div class="col-md-4">
            		<div class="thumbnail">
                	<img src="${ book.image }" />
                	<div class="caption">
                    <h3>${ book.title } <small>${ book.author }</small></h3>
                    <a href="<c:url value='/books/edit/${ book.id }' />" class="btn btn-info">수정</a>
                    <a href="<c:url value='/books/delete/${ book.id }' />" class="btn btn-lg btn-danger">삭제</a>
                </div>
            </div>
        </div>
    	</c:forEach>
     </div>
     
</body>
</html>
