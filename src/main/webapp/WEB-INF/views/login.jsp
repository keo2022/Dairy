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
    <link rel="stylesheet" href="/resources/css/bootstrap.css">

    <style>
        * {
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            font-family: sans-serif;

        }

        .joinForm {
            position: absolute;
            width: 400px;
            height: 400px;
            padding: 30px 20px;
            background-color: #FFFFFF;
            text-align: center;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 15px;
        }

        .joinForm h2 {
            text-align: center;
            margin: 30px;
        }

        .textForm {
            border-bottom: 2px solid #adadad;
            margin: 30px;
            padding: 10px 10px;
        }


        .id {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }

        .pw {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }

        .name {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }

        .btn {
            position: relative;
            left: 40%;
            transform: translateX(-50%);
            margin-bottom: 40px;
            width: 80%;
            height: 40px;
            background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
            background-position: left;
            background-size: 200%;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: 0.4s;
            display: inline;
        }

        .btn:hover {
            background-position: right;
        }
    </style>
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

            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                <li class="nav-item">
                    <a class="nav-link" href="/join">Join</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
            </ul>
                </li>
                </ul>

        </div>
    </div>
</nav>
<c:if test="${param.result == 'error'}">
    <h1>로그인 에러</h1>
</c:if>
<form action="/login" method="POST" class="loginForm">

    <h2>로그인</h2>
    <div class="textForm">
        <input name="userId" type="text" class="id" placeholder="아이디">
    </div>
    <div class="textForm">
        <input name="userPassword" type="password" class="pw" placeholder="비밀번호">
    </div>
    <input type="submit" class="btn" value="L O G I N"/>
</form>

</body>
</html>
