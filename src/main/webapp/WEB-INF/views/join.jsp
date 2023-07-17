<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-03-19
  Time: 오후 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">

  <style>
    * {
      margin: 0px;
      padding: 0px;
      text-decoration: none;
      font-family:sans-serif;

    }

    .joinForm {
      position:absolute;
      width:450px;
      height:400px;
      padding: 30px 20px;
      background-color:#FFFFFF;
      text-align:center;
      top:40%;
      left:50%;
      transform: translate(-50%,-50%);
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
      border:none;
      outline:none;
      color: #636e72;
      font-size:16px;
      height:25px;
      background: none;
    }

    .pw {
      width: 100%;
      border:none;
      outline:none;
      color: #636e72;
      font-size:16px;
      height:25px;
      background: none;
    }
    .pwc {
      width: 60%;
      border:none;
      outline:none;
      color: #636e72;
      font-size:16px;
      height:25px;
      background: none;
    }
    .con{
      width: 40%;
    }

    .name {
      width: 100%;
      border:none;
      outline:none;
      color: #636e72;
      font-size:16px;
      height:25px;
      background: none;
    }

    .btn {
      position:relative;
      left:40%;
      transform: translateX(-50%);
      margin-bottom: 40px;
      width:80%;
      height:40px;
      background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
      background-position: left;
      background-size: 200%;
      color:white;
      font-weight: bold;
      border:none;
      cursor:pointer;
      transition: 0.4s;
      display:inline;
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
<form action="/join" method="POST" class="joinForm">
  <h2>회원가입</h2>
  <div class="textForm">
    <input name="userId" type="text" class="id" placeholder="아이디"/>
  </div>
  <div class="textForm">
    <input name="userPassword" type="password" class="pw" id="pass" placeholder="비밀번호">
  </div>
  <div align="left" class="textForm">
    <%--onkeyup = "js함수" 입력되었을 때--%>
    <input style="display: inline" name="userPasswordConfirm" type="password" class="pwc" id="passcon"
           placeholder="비밀번호 확인"  onkeyup="passConfirm()">
    <sapn id="confirmMsg" class="con" value=" "></sapn>
  </div>
  <div class="textForm">
    <input name="name" type="text" class="name" placeholder="이름">
  </div>
  <input type="submit" class="btn" value="J O I N"/>
</form>

<script type="text/javascript">
  /* 자바 스크립트 함수 선언(비밀번호 확인) */

  function passConfirm() {
    /* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
    /* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
    /* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
    var userPassword = document.getElementById('pass');					//비밀번호
    var userPasswordConfirm = document.getElementById('passcon');	//비밀번호 확인 값
    var confirmMsg = document.getElementById('confirmMsg');			//확인 메세지
    var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
    var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔

    if(userPassword.value == userPasswordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
      confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
      confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
    }else{
      confirmMsg.style.color = wrongColor;
      confirmMsg.innerHTML ="비밀번호 불일치";
    }
  }
</script>
</body>
</html>
