<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>

<link rel="stylesheet" href="/resources/assets/css/chat.css">
	
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

/* .infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 13px;
  text-decoration: none;
  color: black;
} */

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

	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/resources/assets/css/main.css" />
	

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
									 
									<div class="infoContainer">
									    <a href="#" class="item">내채팅</a>
									</div>									  
									

									<!-- <input type="text" id="message" /> <br>
									<input type="button" id="sendBtn" value="채팅 전송"/>
									<div id="messageArea"></div>  -->

									
									 <!-- 채팅 -->
										  <div id="space" style="height:100px;"></div>
										  <div class="container">
										    <div class="messaging">
										      <div class="inbox_msg">
										        <div class="inbox_people">
										          <div class="headind_srch">
										            <div class="recent_heading">
										            
										              ${id }님 채팅 테스트중 ....
										            </div>
										          </div>
										          <div class="inbox_chat" id="inbox_chat" onclick="showChatList();">
													
										          </div>
										        </div>
										        <div class="mesgs" id="chatbox">
										
										
										          <div class="msg_history" id="msg_history">
										          </div>		
										          <div class="type_msg">
										            <div class="input_msg_write">
										              <input type="text" class="write_msg" placeholder="메시지를 입력하세요." id="msgContent" onkeyup="enterkey();"/>
             										  <button class="msg_send_btn" id="sendBtn" type="button" onclick="sendMsg();">
														전송
										             </button>

										            </div>
										          </div>
										        </div>
										      </div>
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
		<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
			
	<script type="text/javascript">
	  let roomNum = 0;  // 채팅방 번호
	  let cnt = 0;  // 방 호출 횟수 (처음만 스크롤 맨 아래로 두기)
	  let maxHeight = 0; // 대화창의 최대 높이
	  let currHeight = 0; // 현재 대화창에서의 높이(위치)
	  let otherPerson = ""; // 대화 상대 아이디
	  
	  // 대화하기 버튼으로 들어온 경우 현재 채팅방 번호 설정
	  if ("${currRoomId}" != null && "${currRoomId}" != "") {
	    roomNum = "${currRoomId}";
	  }
	  	  
	  // 대화 내용 추가 (조회, 입력)
	  const addDialog = function(data, userId) {
	    for (let i=0; i<data.length; i++) {
	       console.log(data[i].chat_date);
	      
	      if (userId == data[i].seller_id) {
	        $('#msg_history')
	          .append($('<div>')
	            .attr('class', 'incoming_msg')
//	             .append($('<div>')
//	               .attr('class', 'incoming_msg_img')
//	               .append($('<img>')
//	                 .attr('src', 'https://ptetutorials.com/images/user-profile.png')
//	                 .attr('alt', 'sunil')
//	               )
//	             )
	            .append($('<div>')
	              .attr('class', 'recieved_msg mb-4')
	              .append($('<div>')
	                .attr('class', 'received_withd_msg')
	                .append($('<p>')
	                  .text(data[i].chat_content)    
	                )
	                .append($('<span>')
	                  .attr('class', 'time_date')
	                  .text(data[i].buyer_id + ' | ' + data[i].chat_date)
	                )
	              )
	            )
	          )
	      } else {
	        $('#msg_history')
	          .append($('<div>')
	            .attr('class', 'outgoing_msg')
	            .append($('<div>')
	              .attr('class', 'sent_msg')
	              .append($('<p>')
	                .text(data[i].chat_content)
	              )
	              .append($('<span>')
	                .attr('class', 'time_date')
	                .text(data[i].chat_date)
	              )
	            )
	          )
	      }
	    }  
	  }
	  
	  // 채팅 목록 추가 (대화 상대)
	  const addChatList = function(data, userId) {
	    for (let i=0; i<data.length; i++) {
	      
	      let person = "";
	      if (userId == data[i].buyer_id) {
	        person = data[i].seller_id;
	      } else {
	        person = data[i].buyer_id;
	      }
	      
	      let className = "";
	      if (roomNum == data[i].room_id) {
	        className = 'chat_list active_chat';
	      } else {
	        className = 'chat_list';
	      } 
	      
	      let chatCtn = "";
	      let chatTime = "";
	      
	      chatCtn = data[i].chat_content;
	      chatTime = data[i].chat_date;
	      /* if (data[i].dataState == "BOTH" || data[i].dataState == userId) {
	        chatCtn = data[i].chat_content;
	        chatTime = data[i].chat_date;
	      } else {
	        continue;
	      } */
	      
	      let notReadMsgCount = "";
	      let countClassName = "";
	      
	     /*  if (data[i].room_id == roomNum) {
	        changeReadMsg(data[i].room_id);
	      } else if (data[i].notReadMsgCount != 0) {
	        notReadMsgCount = data[i].notReadMsgCount;
	        countClassName = "float-end text-center text-white bg-danger rounded-circle";
	      }  */
	      
	      let otherPersonImg = "https://ptetutorials.com/images/user-profile.png";
	     /*  if (data[i].otherPersonImg != null && data[i].otherPersonImg != "") {
	        otherPersonImg = data[i].otherPersonImg;
	      } */
	      
	      let chat_profile = "";
	      if (data[i].chat_profile != null && data[i].chat_profile != "") {
	    	  chat_profile = "["+data[i].chat_profile+"]";
	      }
	      

	      
	      $('#inbox_chat')
	      .append($('<div>')
	        .attr('class', className)
	        .on('click', function() {showDialog(data[i].room_id)})
	        .append($('<div>')
	          .attr('class', 'chat_people')
	          .append($('<div>')
	            .attr('class', 'chat_img')
	            .append($('<img>')
	              .attr('src', otherPersonImg)
	              .attr('alt', 'sunil')
	            )
	          )
	          .append($('<div>')
	            .attr('class', 'chat_ib')
	            .append($('<h5>')
	              .text(person + " " + chat_profile)
	              .append($('<span>')
	                .attr('class', 'chat_date')
	                .text(chatTime)
	              )
	            )
	            .append($('<p>')
	              .text(chatCtn)
	              .append($('<span>')
	                .attr('class', countClassName)
	                .attr('style', 'width : 10%;')
	                .text(notReadMsgCount)
	              )
	            )
	          )
	        ) 
	      )
	    }
	  }
	  
	  // 채팅 내용 조회
	  const showDialog = function(roomid) {
	    roomNum = roomid;
	    cnt = 0;
	    $.ajax({
	      url: "${path}/chatroom/chatdialog",
	      type: "post",
	      data: {"room_id" : roomid},
	      dataType: "json",
	      success: function(data) {
	         console.log(data);
	        
	        // 메시지 기록 비우기
	        $('#msg_history').empty();
	       
	        // 본인 아이디 선언
	        let userId = "${id}";

	        // 상대방 아이디 선언
	        if(roomNum != 0 && data.length != 0) {
	          if (data[0].buyer_id == userId) {
	            otherPerson = data[0].seller_id;
	          } else if (data[0].seller_id == userId){
	            otherPerson = data[0].buyer_id;
	          }
	        }

	        addDialog(data, userId); // 채팅 불러오기  
	        
	        // 대화 시 스크롤 조정을 위한 스크롤 함수
	        $('#msg_history').scroll(function() {
	          // maxHeigth 설정
	          let chatBox = document.getElementById("msg_history");
	          if (maxHeight < chatBox.scrollTop) {
	            maxHeight = chatBox.scrollTop;
	          }
	          
	          // currHeight 설정
	          let scrollT = $(this).scrollTop();
	          currHeight = scrollT;
	        });
	        
	        // max와 curr이 같은 경우 맨 아래로 이동
	        if (currHeight == maxHeight) {
	          scrollDialog();
	          currHeight = maxHeight;
	        }

	        // 처음 조회 시 맨 아래로 이동
	        if (cnt == 0) {
	          scrollDialog();
	          showChatList();
	        }
	        
	      },
	      error: function(request, status, error) {
	        
	      }
	    });
	  }    
	  
	  // 채팅 전송하기
	  const sendMsg = function() {
	    if (roomNum == 0) {
	      alert("채팅방을 선택하세요.");
	      return;
	    }

	    let msgContent = document.getElementById("msgContent");
	    if (msgContent.value == "") {
	      alert("메세지를 입력하세요.");
	      return;
	    }

	    $.ajax({
	      url: "${path}/chatroom/chatdialog/" + roomNum,
	      type: "post",
	      data: JSON.stringify({"room_id" : roomNum, "chat_content" : msgContent.value}),
	      dataType: "json",
	      contentType: 'application/json',
	      success: function(data) {
	         console.log(data);
	        
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
	  };
	  
	  // 채팅 목록 보기
	  const showChatList = function() {
	    $.ajax({
	      url: "${path}/chatroom-info",
	      type: "post",
	      success: function(data) {
	         console.log(data);
	        
	        let userId = "${id}";
	        
	        // 채팅 목록 초기화        
	        $('#inbox_chat').empty();
	        if (data.length != 0) {
	          addChatList(data, userId); 
	        }
	      },
	      error: function(request, status, error) {
	        
	      }
	    });
	  }
	  
	  // 엔터키 누를 시 전송
	  const enterkey = function() {
	    if (window.event.keyCode == 13) {
	      sendMsg();
	    }
	  }

	  // 스크롤 함수
	  const scrollDialog = function() {
	    let chatBox = document.getElementById("msg_history");
	    chatBox.scrollTop = chatBox.scrollHeight; // 대화 시 스크롤 조정
	    maxHeight = chatBox.scrollTop;
	  }
/* 
	  // 반복해야 하는 함수
	  const refreshMethod = function() {
	    showDialog(roomNum);
	    showChatList();
	    cnt++;
	  };

	  // 최초 실행 후 반복 실행
	  function startInterval(seconds, callback) {
	    showDialog(roomNum);
	    showChatList();
	    return setInterval(callback, seconds * 1000);
	  }
	  
	  startInterval(5, refreshMethod);	
	   */
	</script>
	
</body>
</html>