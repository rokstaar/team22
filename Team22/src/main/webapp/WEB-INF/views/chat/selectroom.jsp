<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@6.1.2/bundles/stomp.umd.min.js"></script>
<link rel="stylesheet" href="/resources/assets/css/chat.css">
<link rel="stylesheet" href="/resources/assets/css/main.css" />

<meta charset="UTF-8">
<title>채팅</title>

<style>


	.s_receive_chat {
		background-color: lightblue;
		margin-bottom: 5px;
		border-radius: 10px;
		/* width: 300px; */
		font-size: 1em;
		margin-right: 67%;
		float: left;
		height: auto;
		padding: 10px;
		position: relative;
		margin-left: 20px;
		word-break: break-all;
		font-family: "Noto Sans KR", sans-serif;
		color: #3d4449;
	}
	
	.s_receive_chat:after {
		border-top: 15px solid lightblue;
		border-left: 15px solid transparent;
		border-right: 0px solid transparent;
		border-bottom: 0px solid transparent;
		content: "";
		position: absolute;
		top: 10px;
		left: -14px;
	}
	
	.s_sender_chat {
		float: right;
		margin-left: 67%;
		background-color: lightsalmon;
		margin-bottom: 5px;
		border-radius: 10px;
	/* 	width: 300px; */
		font-size: 1em;
		height: auto;
		padding: 10px;
		position: relative;
		margin-right: 20px;
		word-break: break-all;
		font-family: "Noto Sans KR", sans-serif;
		color: #3d4449;
	}
	
	.s_sender_chat:after {
		border-top: 15px solid lightsalmon;
		border-left: 0px solid transparent;
		border-right: 15px solid transparent;
		border-bottom: 0px solid transparent;
		content: "";
		position: absolute;
		top: 10px;
		right: -15px;
	}
	
	.s_receive {
		background: none;
		font-weight: bold;
		float: left;
		margin-right: 70%;
		height: 55px;
		line-height: 70px;
		margin-left: 20px;
	}
	
	.s_sender {
		background: none;
		font-weight: bold;
		float: right;
		margin-left: 70%;
		height: 55px;
		line-height: 70px;
		margin-right: 20px;
	}
	
	.s_room_tt {
		font-size: 1em;
	    font-weight: bold;
	}
	
	.s_room_part {
	    margin: 0px 0 10px;
	    font-family: "Noto Sans KR", sans-serif;
	    font-weight:bold;
	    font-size: 1.2em;
	    color: #3d4449;
	}
	
	/* 스크롤바 디자인 */
	.s_scroll::-webkit-scrollbar {
    	width: 8px;  /* 스크롤바의 너비 */
    	height: 8px;  /* 스크롤바의 너비 */
	}
	
	.s_scroll::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: #34343482; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	.s_scroll::-webkit-scrollbar-track{
	    background: #4747471a;  /*스크롤바 뒷 배경 색상*/
	}
	
	.s_chat_date {
		float: right;
		margin-left: 67%;
		margin-bottom: 5px;
		border-radius: 10px;
	/* 	width: 300px; */
		font-size: 0.8em;
		height: auto;
/* 		padding: 10px; */
		position: relative;
	 	margin-right: 20px; 
		word-break: break-all;
		font-family: "Noto Sans KR", sans-serif;
	}
	
	.s_sender_chat_date {
		margin-bottom: 5px;
		border-radius: 10px;
		/* width: 300px; */
		font-size: 0.8em;
		margin-right: 67%;
		float: left;
		height: auto;
		position: relative;
		margin-left: 20px;
		word-break: break-all;
		font-family: "Noto Sans KR", sans-serif;
	}
</style>

</head>
<body>
<!-- Wrapper -->
<div id="wrapper">

<!-- Main -->
<div id="main">
	
	<div class="s_chat_home">
	
       	<c:set var="isFirst" value="true" />
       	<div class="s_room_part">
       		${ptitle }
       		<form action="/trade/sellProd" method="post">
       		<input type="hidden" value="${ptitle }"name="product_title" >
       		<c:set var="firstItem" value="${selectChatting }" />
       		<input type="hidden" value="${selectChatting[0].seller_id}" name="sell_mem_id">
       		<input type="hidden" value="${selectChatting[0].buyer_id}" name="buy_mem_id">
       		<input type="hidden" value="${selectChatting[0].product_num}"name="prod_num" >
       			<c:if test="${isFirst}">
			  	<c:if test="${id eq selectChatting[0].seller_id }">
			            <button class="sellProd" style="float: right; font-size:12px;">판매</button>
			  	</c:if>
			    <c:set var="isFirst" value="false" />
	    	  </c:if>
       		
       		</form>
       	</div>
       	
       	<div style="border: 1px solid lightgray; margin-bottom: 10px;"></div>
       	<div id="messageArea" class="s_scroll" style="height: 680px; overflow: auto; ">
       		<!-- 채팅 DB 저장한 것 뿌리기(로그인한 사람 이름과 채팅한 사람 이름이 다르면 수신/같으면 발신 -->
			<c:forEach items="${selectChatting }" var="i" varStatus="status">	
  				<c:choose>
  					<%-- 채팅 작성자와 로그인한 사람과 같으면(발신) --%>
   					<c:when test="${id eq i.buyer_id}">
   						<!-- 이전 index와 비교하려고 index 1 이상부터 -->
	  					<c:if test="${status.index != 0}">
	  						<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 같으면 -->
	  						<c:if test="${selectChatting[status.index-1].buyer_id eq selectChatting[status.index].buyer_id}">
	  							<!-- 채팅 내용만 띄우기 -->
	  							<div class="s_sender_chat">${i.chat_content }</div>
	  							<div class="s_chat_date">${i.chat_date.toString().split("\\.")[0] }</div>
	  						</c:if>
	  						<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 다르면 -->
	  						<c:if test="${selectChatting[status.index-1].buyer_id ne selectChatting[status.index].buyer_id}">
	  							<!-- 이름이랑 채팅 내용 띄우기 -->
	  							<div class="s_sender">${i.buyer_id }</div>
			      				<div class="s_sender_chat">${i.chat_content }</div>

	  						</c:if>
		      			</c:if>
		      			<!-- 현재 index가 0이면 -->
		      			<c:if test="${status.index == 0 }">
		      				<!-- 이름이랑 채팅 내용 띄우기 -->
		      				<div class="s_sender">${i.buyer_id }</div>
		      				<div class="s_sender_chat">${i.chat_content }</div>
		      				<div class="s_chat_date">${i.chat_date.toString().split("\\.")[0] }</div>
	
		      			</c:if>
   					</c:when>
   					
   					<%-- 채팅 작성자와 로그인한 사람과 다르면(수신) --%>
					<c:otherwise>
						<!-- 이전 index와 비교하려고 index 1 이상부터 -->
						<c:if test="${status.index != 0}">
							<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 같으면 -->
	  						<c:if test="${selectChatting[status.index-1].buyer_id eq selectChatting[status.index].buyer_id}">
	  							<!-- 채팅 내용만 띄우기 -->
	  							<div class="s_receive_chat">${i.chat_content }</div>
	  							<div class="s_sender_chat_date">${i.chat_date.toString().split("\\.")[0] }</div>
	  						</c:if>
	  						<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 다르면 -->
	  						<c:if test="${selectChatting[status.index-1].buyer_id ne selectChatting[status.index].buyer_id}">
	  							<!-- 이름이랑 채팅 내용 띄우기 -->
	  							<div class="s_receive">${i.buyer_id }</div>
			      				<div class="s_receive_chat">${i.chat_content }</div>
	  						</c:if>
		      			</c:if>
		      			<!-- 현재 index가 0이면 -->
		      			<c:if test="${status.index == 0 }">
		      				<!-- 이름이랑 채팅 내용 띄우기 -->
		      				<div class="s_receive">${i.buyer_id }</div>
	       					<div class="s_receive_chat">${i.chat_content }</div>
	       					<div class="s_sender_chat_date">${i.chat_date.toString().split("\\.")[0] }</div>
		      			</c:if>
   					</c:otherwise>
  				</c:choose>
   			</c:forEach>
       	</div>
       	
       	<div style="margin-top: 10px;display: flex;justify-content: center; padding: 20px;">
         	<input style="width: 900px; height: 50px; display: inline-block;" type="text" placeholder="채팅 입력" id="message" onkeyup="fn_enter(event)" class="form-control" />
			<button id="sendBtn" style="height: 50px; margin-left: 10px; " class="btn btn-success">전송</button>
		</div>
		
	</div>
	
    </div>
	</div>
			
</body>


<!-- 서브메뉴 눌렀을 때 -->
<script>

	//판매 확정
/* $('.sellProd').on('click', function() {
  if (confirm("판매를 하시겠습니까?")) {
    alert("판매가 완료되었습니다.");
    window.location.href = '/trade/soldProduct';
  }else{
	  return false;
  }
}); */

$('.sellProd').on('click', function() {
	  if (confirm("판매를 하시겠습니까?")) {
	    $.ajax({
	      url: '/sellProd',
	      type: 'POST',
	      success: function(response) {
	        alert("판매가 완료되었습니다.");
	        window.location.href = '/trade/soldProduct';
	      },
	      error: function(xhr, status, error) {
	        console.log(error);
	      }
	    });
	  } else {
	    return false;
	  }
	});









	//전송 버튼 눌렀을 때
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('');
	});
	
	// 엔터키 눌렀을 때
	function fn_enter(e){
		if(e.keyCode == 13){
			sendMessage();
			$('#message').val('');
		}
	}
	
	var id = "${id}";
	var roomNum = "${room_id}";
 	
	var person = "";
	if ("${id}" == "${readRoom.buyer}") {
	  person = "${readRoom.seller}";
	} else {
	  person =  "${readRoom.buyer}";
	} 
   	
	var sock = new SockJS("/chat");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		// 전송 시 DB에 저장하기 위해 이름, 채팅내용, 받는 사람, 방번호 컨트롤러에 넘겨줌 
		sock.send(id + ',' + $("#message").val()  + ',' + person + ',' + roomNum);
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		
		var data = msg.data;
		
		// substring을 이용하여 0부터 첫 번째 구분자(",")까지 잘라 이름을 name 변수에 담아줌
		var name = data.substring(0, data.indexOf(","));
		var remainingData = data.substring(data.indexOf(",") + 1);

		// substring을 이용하여 첫 번째 구분자(",") 다음부터 두 번째 구분자(",")까지 잘라 채팅 내용을 message 변수에 담아줌
		var message = remainingData.substring(0, remainingData.indexOf(","));
		  
		// substring을 이용하여 두 번째 구분자(",") 다음부터 마지막까지 잘라 받는 사람을 toName 변수에 담아줌
		var toName = remainingData.substring(remainingData.lastIndexOf(",") + 1);

		/* var roomNo = data.substring(data.lastIndexOf(",")+1); */
		
		// 전에 똑같은 메시지 있으면 한번만 출력
		if($("#messageArea").children().last().text() != message /*  && roomNum == roomNo  */) {

			if(name == id){ // 보낸 사람의 경우
				// 보낸 사람이 채팅 여러개 보냈을 때 말풍선만 띄워줌
				if($("#messageArea").children().last().hasClass("s_sender_chat")) {
					$("#messageArea").append('<div class="s_sender_chat">' + message + '</div>');
				} else { // 하나만 보냈을 경우에는 이름+말풍선 띄워줌
					$("#messageArea").append('<div class="s_sender">' + name + '</div>');
					$("#messageArea").append('<div class="s_sender_chat">' + message + '</div>');
				}
			} else { // 받는 사람의 경우
				if(name != $(".s_receive").last().text()) { // 받는 사람 name과 받는사람 div의 마지막 text가 다를 경우 이름+말풍선 띄워줌
					$("#messageArea").append('<div class="s_receive">' + name + '</div>');
					$("#messageArea").append('<div class="s_receive_chat">' + message + '</div>');
				} else if($("#messageArea").children().last().hasClass("s_receive_chat")) { // 받는사람 동일인이 여러개 보냈을 때 말풍선만 띄워줌
					$("#messageArea").append('<div class="s_receive_chat">' + message + '</div>');
				} else { // 그 외에 이름+말풍선 띄워줌
					$("#messageArea").append('<div class="s_receive">' + name + '</div>');
					$("#messageArea").append('<div class="s_receive_chat">' + message + '</div>');
				}
			}
		}
		
		// 채팅 여러개 쌓여서 스크롤 바 생길 때 자동으로 가장 하단으로 가기
		var offset = $("#messageArea").children().last().offset();
		$("#messageArea").animate({scrollTop : 90000},0);
	
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		console.log("종료");
	}
	
	// 채팅 조회 시 스크롤바 생겼다면 자동으로 가장 하단으로 가기
	$(document).ready(function() {
		var offset = $("#messageArea").children().last().offset();
		$("#messageArea").animate({scrollTop : 90000},0);
	});
	
</script>
</html>