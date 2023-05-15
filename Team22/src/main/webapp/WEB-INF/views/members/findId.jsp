<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/login.css" />
<style type="text/css">

.findId{
	font-family: "Noto Sans KR", sans-serif;
	margin: 20px;
	text-align: center;
	font-size: 1.3em;
}

</style>

<script type="text/javascript">

	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}

</script>
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
		   		<form class="sign-in__wrap">
		   		<h2 class="sign-in__title">아이디 찾기</h2>
		     		<div class="form-group">
		       			<c:forEach var="m" items="${member}">
		       			<div class="findId">
						     ${m.member_name} 님의 <br>
						     아이디는 <strong>${m.member_id}</strong> 입니다.
		           		</div>
		        		</c:forEach>
		      		</div>
			  		<button type="button" class="btn-default" onclick="location.href='/members/login'">로그인 바로가기</button>

		   		</form>
			</div>

		    </div>
	</div>
</div>
	<%@ include file="../include/sidebar.jsp" %>
	
</div>
</body>
</html>