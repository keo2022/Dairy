<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-05-04
  Time: 오후 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>Title</title>
</head>
<body>
<!-- Nav Bar 양쪽 정렬 -->
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
<table class="wrong-table">
    <thead>
        <tr>
            <th>디렉토리 명</th>
            <th>내용</th>
            <th>틀린 횟수</th>
            <th>제거</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${wrong}" var="wrong">
            <tr>
                <th><a href="/main?directoryId=${wrong.directoryId}">${wrong.directoryName}</a></th>
                <th>${wrong.content}</th>
                <th>${wrong.wrongCount}</th>
                <th>
                    <form action="deleteWrong" method="post">
                        <input name="content" value="${wrong.content}" type="hidden">
                        <input type="submit" value="제거">
                    </form>
                </th>
            </tr>
        </c:forEach>
    </tbody>
</table>


</body>
</html>
