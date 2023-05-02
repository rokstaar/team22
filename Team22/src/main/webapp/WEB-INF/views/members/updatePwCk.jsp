<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/styles.css" />
<link rel="stylesheet" type="text/css" href="/resources/assets/css/membersignup.css" />

<script type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
#addressSearch{
margin-top:5px;
padding: 5px;
}
#m_address_primary{
font-size: 15px;
margin-bottom: 5px;
border: 1px solid #000000;
padding: 6px 12px;
border-radius: 5px;
width: 100%;
color: #000;
font-family: "Noto Sans KR", sans-serif

}
#addressRest{
font-size: 15px; border: 1px solid #000000; padding: 6px 12px;
border-radius: 5px;
width: 100%;
color: #000;
font-family: "Noto Sans KR", sans-serif
}


</style>

</head>
<body>

		<div class="main-content">	

			<h2 class="member-title text-center">회원수정</h2>

			<!-- Form 시작 -->
			<form class="form-signup" id="join" method="post" name="joinform" role="form">
			<input type="hidden" name="member_id" value="${sessionScope.id }">
				
				<!-- 비밀번호 -->
				<div class="form-label-group">
					<label for="pwd">비밀번호</label>
					<br>
					<input type="password" id="pw" name="member_pass" class="form-control form-margin-top" placeholder="비밀번호 확인 후 회원정보페이지이동" size="30" maxlength="16" required=""> 
				</div>
						<span id="pwdcheck_blank1"></span>
					
				<tr>
		<td></td><td colspan="2" style="font-size: 3px" id="pwdcheck_blank1"></td>
	</tr>
				
				
				 
				<div>
				<button type="button" class="btn btn-info btn-sm" onclick="location.href='/members/myPage'" 
				style=" margin-right:  10px;">
				<p class="btn-sign-up">
				취소
				</p>
				</button>
				
				
				<button type="submit" class="btn btn-info btn-sm" style=" margin-right:  10px;">
					<p class="btn-sign-up">
						회원수정
					</p>
				</button>
				
				</div>
			</form>  
		</div>
		

</body>
</html>
