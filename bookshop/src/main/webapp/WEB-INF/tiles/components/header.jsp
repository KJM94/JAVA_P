<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="sec"%>
<%@ page pageEncoding="utf-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <c:url var="rootUrl" value="/" />
    <a class="navbar-brand" href="${ rootUrl }">Yes24</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <c:url var="booksUrl" value="/books" />
            <li class="nav-item active"><a class="nav-link" href="${ booksUrl }">도서<span class="sr-only">(current)</span></a></li>
        </ul>
    </div>
</nav>