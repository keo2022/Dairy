<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-03-19
  Time: 오후 9:54
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
                    <input class="form-control me-2 search-input" name="word" type="search" placeholder="검색"
                           aria-label="Search">
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
<c:if test="${logininfo!=null}">
    <div class="menu-container">
        <ul>
            <div>
                <c:if test="${not empty directoryId and directoryId ne '0'}">
                    <li><a href="/main?directoryId=${back}">..</a></li>
                </c:if>
            </div>
            <c:forEach items="${directory}" var="dir">
                <div>
                    <li><a href="/main?directoryId=${dir.directoryId}"> ${dir.directoryName} </a></li>
                </div>
            </c:forEach>
            <button class="makedir" type="button" onclick="toggleInputField()">+</button>
            <div id="inputField" style="display: none;">
                <form method="post" action="/add">
                    <input type="text" name="directoryName" placeholder="디렉토리 명">
                    <input type="hidden" name="directoryId" value="${directoryId}">
                    <input type="hidden" name="userId" value="${logininfo}">
                    <button type="submit" style="font-size: 20px">만들기</button>
                </form>
            </div>
        </ul>
    </div>
    <div class="content-container">
    <div class="directoryPath">
        /${path}
    </div>
    <c:if test="${not empty directoryId and directoryId ne '0'}">
        <div class="button-container">
            <div class="dropdown" onmouseover="showDropdown()" onmouseout="hideDropdown()">
                <button class="dropdown-btn">학습하기</button>
                <div id="myDropdown" class="dropdown-content">
                    <a href="/study/write?directoryId=${directoryId}">Write</a>
                    <a href="/study/listen?directoryId=${directoryId}">Listen</a>
                    <a href="/study/speak?directoryId=${directoryId}">Speak</a>
                    <a href="/study/blank?directoryId=${directoryId}">Blank</a>
                    <a href="/study/random?directoryId=${directoryId}">Random</a>
                </div>
            </div>
            <button class="addkeyword" type="button" onclick="addKeyword()">이미지 추가>></button>
            <div id="inputKeyword" style="display: none">
                <form action="addKeyword" method="post">
                    <input type="hidden" name="directoryId" value="${directoryId}">
                    <input type="text" name="keyword" placeholder="키워드">
                    <button type="submit">등록</button>
                </form>
            </div>
        </div>

        <div class="memoarea">
            <form method="post" action="/register">
                <textarea name="content" id="resultList" contenteditable>${content}</textarea>
                <input type="hidden" name="directoryId" value="${directoryId}">
                <input type="submit" value="저장">
            </form>
        </div>
        </div>
    </c:if>
</c:if>


<script>
    //디렉토리 추가 입력칸 나오도록 하는 함수
    function toggleInputField() {
        let inputField = document.getElementById("inputField");
        if (inputField.style.display === "none") {
            inputField.style.display = "block";
        } else {
            inputField.style.display = "none";
        }
    }

    //키워드 추가 입력칸 나오도록 하는 함수
    function addKeyword() {
        let inputKeyword = document.getElementById("inputKeyword");
        if (inputKeyword.style.display === "none") {
            inputKeyword.style.display = "block";
        } else {
            inputKeyword.style.display = "none";
        }
    }

    /*학습하기 마우스 가져다 대면 보여주기 떼면 사라지기*/
    function showDropdown() {
        let dropdown = document.getElementById("myDropdown");
        dropdown.style.display = "block";
    }

    function hideDropdown() {
        let dropdown = document.getElementById("myDropdown");
        dropdown.style.display = "none";
    }

    //로그인 안되어있으면 로그인으로 이동
    let login = "${logininfo}";
    if (login == "") {
        window.onload = function () {
            // 다른 페이지로 이동하는 코드
            window.location.href = "/login"; // 이동할 페이지의 URL을 지정해주세요.
        };
    }

</script>
</body>
</html>
