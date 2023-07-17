<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-03-24
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
  var message = "${msg}";
  var url = "${url}";
  alert(message);
  document.location.href = url;
</script>

</body>
</html>
