<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="script.js" defer></script>
<title>타자 치듯이 나오는 UI</title>
<style>
/* css 사이트 */ 
@keyframes typing {
  from { width: 0; }
  to { width: 100%; }
}

#chatbox::placeholder {
  animation: typing 2s steps(40, end);
  overflow: hidden;
  white-space: nowrap;
  border-right: 2px solid; /* 타이핑 커서 역할을 하는 효과를 주기 위해 테두리를 사용합니다. */
}
x

body {
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
	font-family: Arial, sans-serif;
}

#bodybox {
  margin: auto;
  max-width: 550px;
  font: 15px arial, sans-serif;
  background-color: white;
  border-style: solid;
  border-width: 1px;
  padding-top: 20px;
  padding-bottom: 25px;
  padding-right: 25px;
  padding-left: 25px;
  box-shadow: 5px 5px 5px grey;
  border-radius: 15px;
}

#chatborder {
  border-style: solid;
  background-color: #f6f9f6;
  border-width: 3px;
  margin-top: 20px;
  margin-bottom: 20px;
  margin-left: 20px;
  margin-right: 20px;
  padding-top: 10px;
  padding-bottom: 15px;
  padding-right: 20px;
  padding-left: 15px;
  border-radius: 15px;
}

.chatlog {
   font: 15px arial, sans-serif;
}

#chatbox {
  font: 17px arial, sans-serif;
  height: 22px;
  width: 100%;
}

h1 {
  margin: auto;
}

pre {
  background-color: #f0f0f0;
  margin-left: 20px;
}
</style>
</head>
<body>
  <div id='chatborder'>
    <p id="chatlog11" class="chatlog">&nbsp;</p>
    <p id="chatlog10" class="chatlog">&nbsp;</p>
    <p id="chatlog9" class="chatlog">&nbsp;</p>
    <p id="chatlog8" class="chatlog">&nbsp;</p>
    <p id="chatlog6" class="chatlog">&nbsp;</p>
    <p id="chatlog5" class="chatlog">&nbsp;</p>
    <p id="chatlog4" class="chatlog">&nbsp;</p>
    <p id="chatlog3" class="chatlog">&nbsp;</p>
    <p id="chatlog2" class="chatlog">&nbsp;</p>
    <p id="chatlog1" class="chatlog">&nbsp;</p>
    <input type="text" name="chat" id="chatbox" placeholder="Hi there! Type here to talk to me." onfocus="placeHolder()">
  </div>
<script>
var messages = [], //array that hold the record of each string in chat
lastUserMessage = "", //keeps track of the most recent input string from the user
botMessage = "", //var keeps track of what the chatbot is going to say
botName = 'Chatbot', //name of the chatbot
talking = true; //when false the speach function doesn't work
function chatbotResponse() {
talking = true;
botMessage = "I'm confused"; //the default message

if (lastUserMessage === 'hi' || lastUserMessage =='hello') {
  const hi = ['hi','howdy','hello']
  botMessage = hi[Math.floor(Math.random()*(hi.length))];;
}

if (lastUserMessage === 'name') {
  botMessage = 'My name is ' + botName;
}
}
function newEntry() {
if (document.getElementById("chatbox").value != "") {
  lastUserMessage = document.getElementById("chatbox").value;
  document.getElementById("chatbox").value = "";
  messages.push(lastUserMessage);
  chatbotResponse();
  messages.push("<b>" + botName + ":</b> " + botMessage);
  Speech(botMessage);
  for (var i = 1; i < 8; i++) {
    if (messages[messages.length - i])
      document.getElementById("chatlog" + i).innerHTML = messages[messages.length - i];
  }
}
}

function Speech(say) {
if ('speechSynthesis' in window && talking) {
  var utterance = new SpeechSynthesisUtterance(say);
  speechSynthesis.speak(utterance);
}
}

document.onkeypress = keyPress;
function keyPress(e) {
var x = e || window.event;
var key = (x.keyCode || x.which);
if (key == 13 || key == 3) {
  newEntry();
}
if (key == 38) {
  console.log('hi')
}
}

function placeHolder() {
document.getElementById("chatbox").placeholder = "";
}
</script>
</body>
</html>