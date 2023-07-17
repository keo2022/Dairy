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
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <title>Title</title>
</head>
<body>

<a href="/main">main</a>
<a href="/login">login</a>
<a href="/list">list</a>
<script>
    // 페이지 로드 완료 시 실행되는 함수
    window.onload = function() {
        // 다른 페이지로 이동하는 코드
        window.location.href = "/login"; // 이동할 페이지의 URL을 지정해주세요.
    };
</script>

</body>
</html>
