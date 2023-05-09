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
		<a href="/main" class="logo"><strong>있지마켓</strong></a>
		<ul class="icons">
			<c:if test="${id == null }">
				<li><a href="/members/login"><span class="label">로그인</span></a></li>
				<li><a href="members/insert"><span class="label">회원가입</span></a></li>
			</c:if>

			<c:if test="${id != null && id !=('admin')}">
				<li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
				<li><a href="/members/myPage"><span class="label">마이페이지</span></a></li>
				<li><a href="/chatroom"><span class="label">내채팅</span></a></li>
			</c:if>

			<c:if test="${id != null && id ==('admin')}">
				<li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
				<li><a href="/admin/adminPage"><span class="label">관리자</span></a></li>
			</c:if>

		</ul>
	</header>
</body>
</html>