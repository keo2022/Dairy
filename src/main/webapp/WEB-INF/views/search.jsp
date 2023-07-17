<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-05-12
  Time: 오후 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/main">Main</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/main">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/review">Review</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/wrong">Wrong</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">


                    <c:if test="${logininfo==null}">
                        <%--<ul class="navbar-nav">--%>
                <li class="nav-item">
                    <a class="nav-link" href="/join">Join</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
            </ul>
            </c:if>
            <c:if test="${logininfo!=null}">
                <form class="d-flex search-form" action="/search" method="post">
                    <input class="form-control me-2 search-input" name="word" type="search" placeholder="검색" aria-label="Search">
                    <button class="btn btn-outline-success search-button" type="submit">검색</button>
                </form>
                </li>
                <%--<ul class="navbar-nav">--%>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
                </ul>
            </c:if>
        </div>
    </div>
</nav>

<c:if test="${empty search}">
    일치하는 내용이 없습니다.
</c:if>
<c:if test="${not empty search}">
<table class="search-table">
    <thead>
    <tr>
        <th>디렉토리 명</th>
        <th>내용</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${search}" var="search">
        <tr>
            <th><a href="/main?directoryId=${search.directoryId}">${search.directoryName}</a></th>
            <th>${search.content}</th>
        </tr>
    </c:forEach>
    </tbody>
</table>
</c:if>
</body>
</html>
