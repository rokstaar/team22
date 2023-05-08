<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@6.1.2/bundles/stomp.umd.min.js"></script>
<!-- <link rel="stylesheet" href="/resources/assets/css/style.css">  -->
<link rel="stylesheet" href="/resources/assets/css/main.css" />

<meta charset="UTF-8">
<title>채팅</title>

<style>	

	*{
		font-family: "Noto Sans KR","yg-jalnan",sans-serif;
	}
	
	#s_chat_btn {
		width: 240px;
	}
	
	#s_emp_list {
		font-size: 1.1em;
		width: 120px;
		height: 45px;
		border: 1px solid;
	}
	
	#s_chat_list {
		font-size: 1.8em;
		padding-left: 20px;
		font-family: "Noto Sans KR", sans-serif;
		font-weight: bold;
		margin-bottom: 7.7px;
	}
	
	#s_sub_menu {
		display: flex;
		margin-top: 5px;
	}
	
	.s_menu_box {
		width: 242px;
		height: 910px;
		/* border: 1px solid lightgray; */
		border-radius: 10px;
		padding: 20px;
		overflow: auto;
	}
	
	.s_modal_menu_box {
		width: 400px;
		height: 740px;
		border: 1px solid lightgray;
		border-radius: 10px;
		padding: 20px;
		overflow: auto;
	}
	
	.s_emp_box {
		display: flex;
		align-items: center;
		justify-content: space-evenly;
		border-bottom: 1px solid lightgray;
		padding: 10px 0;
	}
	
	.s_img_style {
		width: 50px;
		height: 50px;
		border-radius: 25px;
	}
	
	#s_f_list {
		font-size: 1.2em;
		padding: 10px 0;
		font-weight: bold;
		color: #0d6efd;
		text-align: center;
		margin-top: 5px;
	}
	
	.s_dn_en {
		display: inline-block;
	}
	
	#s_sub_menu_box {
		width: 250px; 
		height: 1000px; 
		margin-top: 25px;
		margin-left: 10px;
	}
	
	#s_menu_box2 {
		display: none;
	}
	
	.s_chat_box {
		margin-bottom: 20px;
		border-bottom: 1px solid lightgray;
		padding-bottom: 20px;
		cursor: pointer;
	}
	
	.modal-body {
		margin: 0 auto;
	}
	
	#s_select_part {
	    text-align: center;
	    height: 100px;
	    overflow: auto;
	    border: 1px solid lightgray;
	    border-radius: 10px;
	    padding: 20px;
	    margin-bottom: 30px;
	    width: 400px;
	}
	
	.s_select_part_tt {
		font-size: 1.2em;
	    font-weight: bold;
	    text-align: center;
    	margin-bottom: 10px;
	}
	
	.s_invite_p {
		border: 1px solid;
	    width: 90px;
	    padding: 0 10px;
	    border-radius: 10px;
	    display: inline-block;
	    margin: 5px;
	}
	
	.btn-close {
		font-size: .7em;
		margin-left: 3px;
	}
	
	#s_select_part_cnt {
		margin-left: 5px;
	    color: gray;
	}
	
	#s_chat_content_box {
		/* border: 1px solid lightgray; */
		height: 1012px;
		width: 1050px;
		margin-top: 20px;
		margin-left: 10px;
		border-radius: 10px;
		padding: 20px;
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
	    border-radius: 10px;
	}
	
	#s_chat_img {
	    display: flex;
	    align-content: stretch;
	    justify-content: center;
	    align-items: center;
	    flex-direction: row;
	    flex-wrap: wrap;
	    margin-top: 320px;
	}
	
	.s_room_tt {
		font-size: 1em;
	    font-family: "Noto Sans KR", sans-serif;
	    font-weight: bold;
	    color:  #769fcd;
	}
	
	.s_chat_tt {
		font-size: 1em;
	    font-family: "Noto Sans KR", sans-serif;
	    font-weight: bold;
	}
	
</style>

</head>
<body>
<!-- Wrapper -->
<div id="wrapper">

<!-- Main -->
<div id="main">
	<div class="inner" style="max-width:100em;">
	
	<%@ include file="../include/header.jsp" %>
	
	<section>
        <article style="float: left; margin-left: 130px;">
        
            <div id="s_sub_menu_box">

				<!-- 서브 메뉴 -->
				<div id="s_sub_menu">
	               <div id="s_chat_list" class="btn btn-light s_chat_menu">내 채팅</div> 
                </div>
		           <!--  <div style="border: 1px solid lightgray; margin-bottom: 10px;"></div> -->
                <!-- 채팅 리스트 클릭 시 띄울 내용 -->
                <div id="s_menu_box2" class="s_menu_box s_scroll">
                	<!-- 채팅방 리스트만큼 반복문 실행 -->
                	<c:forEach items="${chatList }" var="i">
          
	                	<div class="s_chat_box">
	                		<!-- 채팅방 상세조회 시 넘길 방 번호 hidden으로 주기 -->
	                		<input type="hidden" id="${i.room_id }" value="${i.room_id }">
	                		<!-- 방 제목 표기 -->
		                	<%-- <div class="s_room_tt">${i.room_id}</div> --%>
		                	
		                	<c:if test="${id eq i.buyer_id}">
		                		<div class="s_room_tt">${i.seller_id }</div>
		                	</c:if>
		                	<c:if test="${id eq i.seller_id}">
		                		<div class="s_room_tt">${i.buyer_id }</div>
		                	</c:if>
		                	
		                	<!-- 해당 방 마지막 대화 표기 -->
 		                 	<c:if test="${empty i.chat_content}">
		                		<div class="s_chat_tt"> 대화를 시작해주세요.</div>
		                	</c:if>
		                	<c:if test="${not empty i.chat_content }">
		                		<div class="s_chat_tt">${i.chat_content }</div>
		                	</c:if>
	                	</div>
                	</c:forEach>
                </div>
                
            </div>
        </article>  
        
     <article style="float: left;">
        <div class="s_chat_home">
	
       	<div class="s_room_part">
       		${ptitle }
       	</div>
       	<div style="border: 1px solid lightgray; margin-bottom: 10px;"></div>
       	<div id="messageArea" class="s_scroll" style="height: 830px; overflow: auto; ">
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
        </article>    
        
    </section>
    
    </div>
	</div>

	<%@ include file="../include/sidebar.jsp" %>
	
</div>
			
</body>

<!-- 서브메뉴 눌렀을 때 -->
<script>
	// 채팅 리스트 클릭했을 때
		$("#s_menu_box2").css('display', 'block');
		$("#s_menu_box1").css('display', 'none');
		$("#s_chat_list").attr('class', 'btn btn-primary');
		$("#s_emp_list").attr('class', 'btn btn-light');
		$("#s_emp_list").css('border', '1px solid');

	
	// 채팅 리스트에 있는 채팅방 리스트 클릭했을 때
	$(".s_chat_box").click(function() {
		$(".s_chat_box").css('color', '#7f888f');
		$(this).css('color', '#769fcd');

	});
	
	</script>

<!-- 채팅 리스트에서 방 눌렀을 때 -->
<script>
	$(".s_chat_box").click(function() {
		// hidden으로 넣어준 방 번호 value roomNo 변수에 담아주어 전달
		var roomNo = $(this).children().val();
		$("#s_chat_content_box").load("<%=request.getContextPath()%>/chatroom/chatdialog?room_id=" + roomNo);
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
		
		// 기존 소켓을 끊지 못하는 이슈로(수정 못함 ㅠ) 전에 똑같은 메시지 있으면 한번만 출력 및 방 번호 체크
		if($("#messageArea").children().last().text() != message /*  && roomNum == roomNo  */) {
			// 보낸사람/받는사람 구분은 로그인한 이름과 비교
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