<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/login.css" />
<style type="text/css">
</style>
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

<!-- Main -->
<div id="main">
	<div class="inner" style="max-width:95em;">
	
	<%@ include file="../include/header.jsp" %>

		<div class="main-content">
		
			<div class="sign-in">
				<form class="sign-in__wrap" id="join" method="post" name="joinform" role="form">
				<input type="hidden" name="member_id" value="${sessionScope.id }">
				<h2 class="sign-in__title">회원 정보 수정</h2>

				<!-- 비밀번호 -->
				<div class="id-form__wrap">
					<label for="pwd">비밀번호</label>
					<div class="id-form">
						<input type="password" id="pw" name="member_pass" 
						class="id-form__input" placeholder="비밀번호를 입력해주세요." 
						size="30" maxlength="16"> 
					</div>
				</div>
		<span id="pwdcheck_blank1"></span>		
				
				 <button type="submit" class="btn__wrap btn-default" onclick="location.href='/members/myPage'">
		               수정하기
		         </button>
		         
		         <div style="text-align: center; margin-top: 20px;">
					  <a href="/members/myPage">
					   	취소
					  </a>
				</div>
		        </form>
		   </div>
		   
		   </div>
		</div>
</div>

<%@ include file="../include/sidebar.jsp" %>
	
</div>
</body>
</html>
