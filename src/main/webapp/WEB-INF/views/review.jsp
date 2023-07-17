<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-05-04
  Time: 오후 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.lang.Math" %>
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

<table class="review-table">
    <thead>
    <tr>
        <th>디렉토리 명</th>
        <th>공부 횟수</th>
        <th>최근 공부일자</th>
        <th>공부 후 지난 시간</th>
        <th>기억 정도</th>
        <th>제거</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${review}" var="rev">
        <c:set var="date1Str" value="${today}" />
        <c:set var="date2Str" value="${rev.recent}" />

        <c:set var="date1" value="${LocalDate.parse(date1Str)}" />
        <c:set var="date2" value="${LocalDate.parse(date2Str)}" />

        <c:set var="daysBetween" value="${ChronoUnit.DAYS.between(date2, date1)}" />

        <c:choose>
            <c:when test="${rev.studyCount eq 1}">
                <%-- 첫 번째 경우의 수에 따른 변수 설정 --%>
                <c:set var="speed" value="0.4" />
            </c:when>
            <c:when test="${rev.studyCount eq 2}">
                <%-- 두 번째 경우의 수에 따른 변수 설정 --%>
                <c:set var="speed" value="0.3" />
            </c:when>
            <c:when test="${rev.studyCount eq 3}">
                <%-- 세 번째 경우의 수에 따른 변수 설정 --%>
                <c:set var="speed" value="0.2" />
            </c:when>
            <c:otherwise>
                <%-- 네 번째 경우의 수에 따른 변수 설정 --%>
                <c:set var="speed" value="0.1" />
            </c:otherwise>
        </c:choose>
        <c:set var="remember" value="${100 * Math.exp(-speed * (daysBetween/2))}"/>
        <tr>
            <th><a href="/main?directoryId=${rev.directoryId}">${rev.directoryName}</a></th>
            <th>${rev.studyCount}</th>
            <th>${rev.recent}</th>
            <th>${daysBetween}일</th>
            <td style="position: relative;">
                <div style="position: absolute; top: 0; left: 0; width: ${remember}%; height: 99%; background-color: #3498db;"></div>
            </td>
            <th>
                <form action="deleteReview" method="post">
                    <input name="content" value="${rev.content}" type="hidden">
                    <input type="submit" value="제거">
                </form>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
