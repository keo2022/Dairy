<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-04-05
  Time: 오후 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
speak
<form action="/confirm" method="post">
    <input id="con" value="${getOne.content}"/>
    <div class="words" contenteditable>
        <input type="text" name="content" id="resultList" value="undefined" size="80"/>
    </div>
    <button type="button" onclick="checkSpeak()">확인</button>
</form>
<button class="dictate">mike</button>
<script>
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

        document.getElementById("resultList").value = texts;
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
    };

    $('.dictate').addEventListener('click', () => {
        if(store.isRecognizing){
            active();
        } else {
            unactive();
        }
    });

</script>
</body>
</html>
