<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<li><a href="/admin/pagemain"><span class="label">관리자</span></a></li>
			</c:if>

		</ul>
	</header>
	
	
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