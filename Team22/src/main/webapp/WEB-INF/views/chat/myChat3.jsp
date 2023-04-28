<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>My Page</title>
<link rel="stylesheet" href="/resources/assets/css/chat.css">
<link rel="stylesheet" href="/resources/assets/css/main.css" />
	
<style type="text/css">
body{
  padding: 0;
  margin: 0;
}

div{
  box-sizing: border-box;
}

/* alert badge */
.circle{
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 2.5px;
  background-color: #ff0000;
  position: absolute;
  top: -5px;
  left: 110%;
}

/* 파랑색 테스트 */
.rightBlue{
  color: #3F72AF;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 20px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer{
  background-color: white;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 파란 숫자 */
.summaryContainer .rightBlue{
  font-size: 19px;
  font-weight: bold;
  color: #3F72AF;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer{
  padding: 21px 16px;
  background-color: white;
  margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title{
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status{
  display: flex;
  justify-content: space-between;
  margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item{
  display: flex;
}

.shippingStatusContainer .number{
  font-size: 31px;
  font-weight: 500;
  text-align: center;
}
.shippingStatusContainer .text{
  font-size: 14px;
  font-weight: normal;
  color: black;
  font-weight : bold;
  text-align: center;
}
.shippingStatusContainer .memberUpdate{
  font-size: 14px;
  font-weight: normal;
  color: #769fcd;
  font-weight : bold;
  text-align: center;
}
.shippingStatusContainer .icon{
  display: flex;
  align-items: center;
  padding: 20px;
  width: 16px;
  height: 16px;
}


/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
.listContainer{  
  padding: 0;
  background-color: #ffffff;
  margin-bottom: 10px;
}
.listContainer .item{  
  display: flex;
  align-items: center;
  padding: 16px;
  color: black;
  text-decoration: none;  
  height: 56px;
  box-sizing: border-box;
}
.listContainer .icon{  
  margin-right: 14px;
}
.listContainer .text{
  font-size: 16px;
  position: relative;
}
.listContainer .right{
  margin-left: auto;
}


/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight{
  font-size: 14px;
  color: #c2c2c2;  
}
.listContainer .smallLight > span{
  margin-left: 10px;
}

.listContainer .right .blct{
  font-size: 14px;
  font-weight: bold;
  margin-right: 5px;
}

/* 공지사항 이용안내 고객센터 */
.infoContainer{
  background-color: white; 
  display: flex;
  height: 100px;
  margin-bottom: 10px;    
}

.infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 23px;
  text-decoration: none;
  color: 769fcd;
  font-weight: bold;
}
.infoContainer .item > div:first-child{
  margin-bottom: 2px;
}

/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}
		
</style>

</head>

	<body>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<%@ include file="../include/header.jsp" %>

							<!-- Banner -->
								<section id="banner">
								
									<div class="content">
									
									<div class="wrap">
									  <div class="shippingStatusContainer">
									    <div class="status">
									      
									      <div class="item">
									        <div>
									        	<img alt="프로필사진" src="/resources/images/pic01.jpg" width="100px" height="100px" >
									        </div>
									       
									        <div>
									          <div class="text">관리자</div>
									       	   <div class="text">페이 : 50,000원</div>
									        	<div class="memberUpdate">
									        		<a href="#">회원정보수정</a>
									        	</div>
									          </div>
									        </div>
										      
									      <div class="item">
									        <div>
									          <div class="text">거래내역</div>
									          <div class="rightBlue number">6</div>
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									          <div class="text">거래내역</div>
									          <div class="rightBlue number">6</div>
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									          <div class="text">경매내역</div>
									          <div class="rightBlue number">0</div>
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									          <div class="text">찜한상품</div>
									          <div class="rightBlue number">1</div>
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									          <div class="text">거래후기</div>
									          <div class="rightBlue number">3</div>
									        </div>
									      </div>     
									      
									    </div>		    
									  </div>  
									</div>	
																					
									<div class="container" style="padding:50px 0; height: 800px;">

							상품번호 : ${pnum }
							제목 : ${ptitle }
									<div class="row">
										<div class="col-sm-3"></div>
										<div class="col-sm-6">
											<div class="col-8" style="text-align: center;">
											
												<c:choose>
													<c:when test="${seller eq id}">
														${buyer}
													</c:when>
													<c:otherwise>
														${seller }
													</c:otherwise>
												</c:choose>님과 대화
												 

											</div>
										</div>
										<div class="col-sm-3"></div>
										
									</div>
										<div class="col-sm-3"></div>
										<div class="col-sm-6">
											<div class="col-10"	style="margin: 20px auto; text-align: center; color: white; background-color: #7099e0; border: 1px solid #7099e0; padding: 10px 10px; border-radius: 8px;">
												${id}님 채팅창 <br>
											</div>
										</div>
										<div class="col-sm-3"></div>
							
									<!-- 채팅 내용 -->
										<div class="col-sm-3"></div>
										<div class="col-sm-6">
											<div class="col-11"	style="margin: 0 auto;  height: 500px; border-radius: 10px; overflow: auto"	id="chatArea">
												<div id="chatMessageArea" style="margin-top: 10px; margin-left: 10px;"></div>
											</div>
										</div>
										<div class="col-sm-3"></div>
							
									
									<!-- 채팅 입력창 -->
										<div class="col-sm-3"></div>
										<div class="col-sm-6">
											<input type="text" class="form-control" style="height: 65px; float: left; width: 80%"	placeholder="메세지를 입력하세요." id="message">
											<a style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id="sendBtn" >
												<button onclick="sendMsg();" style="float: right; width: 18%; height: 65px; text-align: center; border-radius: 5px;">
													전송
												</button>
											</a>
										</div>
										</div>						  
												
									</div>

								</section>
							<!-- banner -->

						</div>
					</div>
					
					
					<%@ include file="../include/sidebar.jsp" %>
			</div>


	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/skel.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" 
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<script type="text/javascript">
	 let roomNum = 0;  // 채팅방 번호
	 
	 // 대화하기 버튼으로 들어온 경우 현재 채팅방 번호 설정
	 if ("${currRoomId}" != null && "${currRoomId}" != "") {
		 roomNum = "${currRoomId}";
		 }
	 
	 // 채팅 전송하기
	 const sendMsg = function() {
		if (roomNum == 0) {
			alert("채팅방을 선택하세요.");
			return;
	    }
	  };
	  	  
		connect();
		function connect() {
			sock = new SockJS("<c:url value="/chat"/>");
			sock.onopen = function() {
				console.log('open');
			};
			sock.onmessage = function(evt) {
				var data = evt.data;
				console.log(data);
				var obj = JSON.parse(data);
				
				//if(obj.buyer_id === ${data.seller_id })
				//cosole.log(${data.seller_id });
				//console.log(obj);
				//console.log(obj.user_id);
				appendMessage(obj.message_content, obj.msg_sender);
			};
			sock.onclose = function() {
				appendMessage("연결을 끊었습니다.");
				console.log('close');
			};

		}

		function send() {
			var msg = $("#message").val();
			if (msg != "") {
				message = {};
				message.message_content = $("#message").val()
				message.buyer_id = '${id }'
				message.seller_id = '${seller }'
				message.product_id = '${pnum}'
			//message.chat_id = '${data.chat_id}'
				message.msg_sender = '${id }'
			}

			sock.send(JSON.stringify(message));
			$("#message").val("");
			

		    $.ajax({
		      url: "${path}/chatroom/chatdialog/" + roomNum,
		      type: "post",
		      data: JSON.stringify({"roomId" : roomNum, "chatContent" : message.value}),
		      dataType: "json",
		      contentType: 'application/json',
		      success: function(data) {
//		         console.log(data);
		        
		        $('#msg_history').empty();
		        msgContent.value = "";
		        
		        let userId = "${id}";
		        
		        addDialog(data, userId); // 채팅 추가     
		        showChatList(); // 채팅 목록 새로고침
		        scrollDialog(); // 스크롤 맨 아래로 이동
		      
		      },
		      error: function(request, status, error) {
		        
		      }
		    });
			
		}

		function getTimeStamp() {
			var d = new Date();
			var s = 
					+ leadingZeros(d.getMonth() + 1, 2) + '월 '
					+ leadingZeros(d.getDate(), 2) + '일 ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2);
					/* + leadingZeros(d.getSeconds(), 2); */

			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
		}
		function appendMessage(msg, msg_sender) {

			if (msg == '') {
				return false;
			} else {
				
				var t = getTimeStamp();
	
				$("#chatMessageArea")
						.append(
								
								"<div class='col-12 row' style = 'height : auto; margin-top : 5px;'>"
								+"<div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'>"
								/* +"<div style='font-size:9px; clear:both;'>"+msg_sender+"</div>" */
								+"</div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#95c4de; padding : 5px 5px; float:right; border-radius:10px;'><span style = 'font-size : 12px;'>"
										+ msg
										+ "</span></div><div col-12 style = 'font-size:9px; text-align:right;'>"
										+"<span style ='float:right; font-size:9px; text-align:right;' >"
										+ t + "</span></div></div></div>")

				var chatAreaHeight = $("#chatArea").height();
				var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
				$("#chatArea").scrollTop(maxScroll);

			}
		}
		$(document).ready(function() {
			$('#message').keypress(function(event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}
				event.stopPropagation();
			});

			$('#sendBtn').click(function() {
				send();
			});
		});
		
		
	</script>
			
	</body>
	
</html>