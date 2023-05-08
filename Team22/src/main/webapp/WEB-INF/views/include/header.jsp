<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	var socket = null;
	$(document).ready(function() {
		// 웹소켓 연결
		sock = new SockJS("<c:url value="/echo"/>");
    	socket = sock;
    	
    	// 데이터를 전달 받았을때
    	sock.onmessage = onMessage; 
	});
	
	function onMessage(evt) {
		var data = evt.data;
		
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
	    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
	    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
	    toast += "<span aria-hidden='true'>&times;</span></button>";
	    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
	    
	    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
	    $(".toast").toast({"animation": true, "autohide": false});
	    $('.toast').toast('show');
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<a href="/main" class="logo">
			<!-- 로고 이미지 넣을거임 -->
			<strong>있지마켓</strong>
		</a>
		<ul class="icons">
		
			<c:if test="${id == null }">
				<li><a href="/members/login"><span class="label">로그인</span></a></li>
				<li><a href="/members/insert"><span class="label">회원가입</span></a></li>
			</c:if>

			<c:if test="${id != null && id !=('admin')}">
				<!-- id에 "N_"을 포함하는 경우에는 naverLogout() 함수 호출하여 로그아웃 -->
				<c:if test="${id.indexOf('N_') != -1}">
					<li><a onclick="naverLogout()" target="_parent" class="btn_logout" data-clk="nmy.logout">로그아웃</a></li>
				</c:if>
				<!-- 일반 로그아웃 -->
				<c:if test="${id.indexOf('N_') == -1}">
					<li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
				</c:if>
				<li><a href="/members/myPage"><span class="label">마이페이지</span></a></li>
				<li><a href="/chatroom"><span class="label">내채팅</span></a></li>
				
			</c:if>
			
			<c:if test="${id != null && id ==('admin')}">
				<li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
				<li><a href="/admin/adminPage"><span class="label">관리자</span></a></li>
			</c:if>

		</ul>
	</header>
	
	<div id="msgStack"></div>
	
<!-- 네이버 로그아웃-->
<script>
function naverLogout(){
	var popup = window.open('https://nid.naver.com/nidlogin.logout?returl=https%3A%2F%2Fwww.naver.com','title','height=10,width=10');
	setTimeout(function(){
		popup.close();
		location.href="/members/logout";
	},150);
}		
</script>

</body>
</html>