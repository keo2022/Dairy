<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-04-05
  Time: 오후 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
    <link rel="stylesheet" href="/resources/css/study.css">
    <meta charset="UTF-8">
    <title>Speak</title>
</head>
<body>
<h1>문장 말하기</h1>
<p>아래의 문장을 따라 말해보세요.</p>
<div class="mike">
    <c:set var="index" value="${index}" />
    <c:if test="${fn:length(content[index]) < 3}">
        <c:set var="index" value="${index + 1}" /><!-- index에 1을 더함 -->
    </c:if>
    <p id="sentenceToCopy">${content[index]}</p>

    <button class="dictate">말하기</button>
</div>
<p>
    <label for="userInput">입력:</label>
    <input type="text" id="userInput">
    <button type="button" onclick="checkAnswer()">정답 확인</button>
    <button type="button" onclick="clearInput()">지우기</button>
<div class="submitWrong">
    <p id="result"></p>
    <div id="wrong" style="display: none;">
        <form method="post" action="/wrong">
            <input type="hidden" name="directoryId" value="${directoryId}">
            <input type="hidden" name="userId" value="${logininfo}">
            <input type="hidden" name="directoryName" value="${directoryName}">
            <input type="hidden" name="content" value="${content[index]}">
            <button type="submit" class="addWrong">오답노트에 넣기</button>
        </form>
    </div>
</div>
<div id="next" style="display: none;">
    <c:set var="content" value="${content}" />
    <c:if test="${not empty content}">
        <c:set var="arraySize" value="${fn:length(content)}" />
        <c:if test="${index lt arraySize-1}">
            <a href="/study/speak?directoryId=${directoryId}&index=${index+1}">다음문제로 이동 ㅡ></a>
        </c:if>
        <c:if test="${index eq arraySize-1}">
            <form method="post" action="/review">
                <input type="hidden" name="directoryId" value="${directoryId}">
                <button type="submit" class="submitReview" id="myButton">학습 완료</button>
            </form>
        </c:if>
    </c:if>
</div>
</p>

<br><br>
<div>
    <a href="/main?directoryId=${directoryId}" style="font-size: 25px">목록으로 돌아가기</a>
</div>


<script>
    function checkAnswer() {
        let sentenceToCopy = document.getElementById("sentenceToCopy").innerText;
        let userInput = document.getElementById("userInput").value;
        let wrong = document.getElementById("wrong");
        let next = document.getElementById("next");

        if (sentenceToCopy == userInput) {
            document.getElementById("result").textContent = "정답입니다!";
            next.style.display = "inline";
        } else {
            document.getElementById("result").textContent = "오답입니다!";
            wrong.style.display = "inline";
            next.style.display = "inline";
        }
    }
    //speak
    const $ = (el) => document.querySelector(el);

    const store = {
        texts : '',
        isRecognizing: true
    };

    window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

    let recognition = new SpeechRecognition();
    recognition.interimResults = true;
    recognition.continuous = true;
    recognition.lang = 'ko-KR';


    recognition.onresult = function(e) {
        let texts = Array.from(e.results)
            .map(results => results[0].transcript).join("");

        document.getElementById("userInput").value = texts;
    };
    /*    버튼으로 음성 켜고 끄기*/
    const active = () => {
        $('.dictate').classList.add('on')
        store.isRecognizing = false;
        recognition.start();
    };

    const unactive = () => {
        $('.dictate').classList.remove('on')
        store.isRecognizing = true;
        recognition.stop();
        console.log("mike end")
    };

    $('.dictate').addEventListener('click', () => {
        if(store.isRecognizing){
            active();
        } else {
            unactive();
        }
    })


    //clear 초기화
    function clearInput() {
        document.getElementById("userInput").value = "";
        document.getElementById("result").textContent = "";
    }

    //학습 완료 버튼 마우스 오버
    document.addEventListener("DOMContentLoaded", function() {
        var myButton = document.getElementById("myButton");

        myButton.addEventListener("mouseover", function() {
            myButton.classList.add("button-highlight"); // 강조 효과를 주는 CSS 클래스 추가
        });

        myButton.addEventListener("mouseout", function() {
            myButton.classList.remove("button-highlight"); // 강조 효과를 주는 CSS 클래스 제거
        });
    });

</script>

</body>
</html>