<%--
  Created by IntelliJ IDEA.
  User: dmsdh
  Date: 2023-04-05
  Time: 오후 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>문장 맞추기 게임</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        p {
            margin: 10px 0;
            color: #333;
        }
        #sentenceToCopy {
            font-size: 1.2em;
            font-weight: bold;
        }
        label {
            font-weight: bold;
            color: #333;
        }
        input[type="text"] {
            padding: 5px;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-size: 1.2em;
            width: 80%;
            margin-top: 5px;
        }
        #result {
            margin-top: 10px;
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1>문장 맞추기 게임</h1>
<p>아래의 문장을 따라 적으세요.</p>
<p id="sentenceToCopy">${getOne.content}</p>
<input id="listenval" type="hidden" value="" autocomplete="off" readonly="">
<input type="button" value="듣기"/>
<input id="listenval2" type="hidden" value="" autocomplete="off" readonly="">
<input type="button" value="듣기"/>
<p>
    <label for="userInput">입력:</label>
    <input type="text" id="userInput" onkeyup="checkAnswer()">
</p>
<p id="result"></p>
<button class="dictate">mike</button>
<button type="button" onclick="clearInput()">Clear Input</button>


<script>
    function checkAnswer() {
        var sentenceToCopy = document.getElementById("sentenceToCopy").textContent;
        var userInput = document.getElementById("userInput").value;
        if (sentenceToCopy == userInput) {
            document.getElementById("result").textContent = "정답입니다!";
        } else {
            document.getElementById("result").textContent = "오답입니다!";
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
        checkAnswer();
    };

    $('.dictate').addEventListener('click', () => {
        if(store.isRecognizing){
            active();
        } else {
            unactive();
        }
    })
    //listen
    var voices = [];
    function setVoiceList() {
        voices = window.speechSynthesis.getVoices();
    }
    setVoiceList();
    if (window.speechSynthesis.onvoiceschanged !== undefined) {
        window.speechSynthesis.onvoiceschanged = setVoiceList;
    }
    function speech(txt) {
        if(!window.speechSynthesis) {
            alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
            return;
        }
        var lang = 'ko-KR';
        var utterThis = new SpeechSynthesisUtterance(txt);
        utterThis.onend = function (event) {
            console.log('end');
        };
        utterThis.onerror = function(event) {
            console.log('error', event);
        };
        var voiceFound = false;
        for(var i = 0; i < voices.length ; i++) {
            if(voices[i].lang.indexOf(lang) >= 0 || voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
                utterThis.voice = voices[i];
                voiceFound = true;
            }
        }
        if(!voiceFound) {
            alert('voice not found');
            return;
        }
        utterThis.lang = lang;
        utterThis.pitch = 1;
        utterThis.rate = 1;  //속도
        window.speechSynthesis.speak(utterThis);
    }
    document.addEventListener("click", function(e) {
        var t = e.target;
        var input = t.previousElementSibling;
        speech(input.value);
    });

    //clear 초기화
    function clearInput() {
        document.getElementById("userInput").value = "";
        document.getElementById("result").textContent = "";
    }
</script>
<script type="text/javascript">
    //listen에서 value값 사이 공백 없애기
    var listenval = "${getOne.content}";
    document.getElementById('listenval').value = listenval.replace(/ /g, '&nbsp;');
    document.getElementById('listenval').value = listenval.replace(/&nbsp;/g, ' ');
</script>
<script>
    //listen
    let voices = [];
    function setVoiceList() {
        voices = window.speechSynthesis.getVoices();
    }
    setVoiceList();
    if (window.speechSynthesis.onvoiceschanged !== undefined) {
        window.speechSynthesis.onvoiceschanged = setVoiceList;
    }
    function speech(txt) {
        if(!window.speechSynthesis) {
            alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
            return;
        }
        let lang = 'ko-KR';
        let utterThis = new SpeechSynthesisUtterance(txt);
        utterThis.onend = function (event) {
            console.log('end');
        };
        utterThis.onerror = function(event) {
            console.log('error', event);
        };
        let voiceFound = false;
        for(let i = 0; i < voices.length ; i++) {
            if(voices[i].lang.indexOf(lang) >= 0 || voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
                utterThis.voice = voices[i];
                voiceFound = true;
            }
        }
        if(!voiceFound) {
            alert('voice not found');
            return;
        }
        utterThis.lang = lang;
        utterThis.pitch = 1;
        utterThis.rate = 1;  //속도
        window.speechSynthesis.speak(utterThis);
    }
    document.addEventListener("click", function(e) {
        let t = e.target;
        let input = t.previousElementSibling;
        speech(input.value);
    });
    //listen에서 value값 사이 공백 없애기
    let listenval = "${content[index]}";
    document.getElementById('listenval').value = listenval.replace(/ /g, '&nbsp;');
    document.getElementById('listenval').value = listenval.replace(/&nbsp;/g, ' ');
</script>
</body>
</html>