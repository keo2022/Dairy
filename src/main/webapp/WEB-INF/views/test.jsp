<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-05-20
  Time: 오전 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>문장 랜덤 재배치</title>
  <script>
    let sentence = "가나 다라 마바 사아";
    let sentenceArray = sentence.split(" ");
    let shuffledSentences = sentenceArray.slice(0); // 원본 배열 복사
    shuffledSentences.sort(function() { return 0.5 - Math.random(); });
  </script>
</head>
<body>
<h1>문장 랜덤 재배치 결과</h1>
<ul>
  <c:forEach var="sentence" items="${shuffledSentences}">
    <li>${sentence}</li>
  </c:forEach>
</ul>
</body>
</html>



