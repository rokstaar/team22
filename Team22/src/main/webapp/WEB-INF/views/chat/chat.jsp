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
		font-style: #3d4449;
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
        	<!-- 채팅방 클릭 시 해당 채팅방 띄울 div -->
            <div id="s_chat_content_box">
            	<!-- <img width="100px" style="display: block; margin: 450px;"src="/resources/images/free-icon-bubble-chat-2821941.png"> -->
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

	$("#s_menu_box2").css('display', 'block');
	$("#s_menu_box1").css('display', 'none');
	$("#s_chat_list").attr('class', 'btn btn-primary');
	$("#s_emp_list").attr('class', 'btn btn-light');
	$("#s_emp_list").css('border', '1px solid');

	// 채팅 리스트에 있는 채팅방 리스트 클릭했을 때
	$(".s_chat_box").click(function() {
		$(".s_chat_box").css('color', '#3d4449');
		$(this).css('color', '#769fcd');

	});
	
</script>

<script>
	// 내 채팅 눌렀을때 로드되는 화면
	// ${room_id}가 빈 문자열인 경우 채팅 메인 이미지 출력
	var rno = "";
	if ('${room_id}' === "") {
		  $(document).ready(function() {
		    $("#s_chat_content_box").html('<img width="100px" style="display: block; margin: 450px;" src="/resources/images/free-icon-bubble-chat-2821941.png">');
		  });
	} 
	// ${room_id}가 존재하는 경우
	else { 
		rno = '${room_id}';
		  $(document).ready(function() {
		    $("#s_chat_content_box").load('/selectroom?room_id=' + rno);
		  });
	}

	// 채팅 리스트에서 방 눌렀을 때
	$(".s_chat_box").click(function() {
		// hidden으로 넣어준 방 번호 value roomNo 변수에 담아주어 전달
		var roomNo = $(this).children().val();
		$("#s_chat_content_box").load('/selectroom?room_id=' + roomNo);
	});
</script>

</html>