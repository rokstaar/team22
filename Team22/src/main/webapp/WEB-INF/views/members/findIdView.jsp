<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/login.css" />
<style type="text/css">
/* 
.email-form__input {
    display: block;
    width: 350px;
    height: 25px;
    padding: 6px 12px;
    font-size: 16px;
    line-height: 1.42857143;
    color: #000;
    background-color: #fff;
    background-image: none;
    border: 1.5px solid #000;
    border-radius: 6px;
    font-family: "Noto Sans KR", sans-serif;
    font-weight: 500;
	margin-bottom: 20px;
	margin: auto;
}

.sign-in-info__list {
    display: flex;
    justify-content: space-around;
    font: 500 14px "Noto Sans KR", sans-serif;
    color: #000;
    margin-top: 20px;
    margin-bottom: 40px;
    text-decoration: none;
}

ul, li, li a {
    list-style: none;
    text-decoration: none;
    
    
}
.find_id_box{
  width: 500px;
  margin: 15% auto;
}

.findIdLogin{
   color:#000000;
    font: 1000 14px "Noto Sans KR", sans-serif;
    
}
.findIdMain{
color:#000000;
    font: 1000 14px "Noto Sans KR", sans-serif;
margin-right: 30px;
}

 */
 

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
		        <form class="sign-in__wrap" action="/members/findId" method="POST">
				<h2 class="sign-in__title">아이디 찾기</h2>
				
		            <div class="id-form__wrap">
		            	<label>이메일</label>
		            	<div class="id-form">
		                	<input type="email" class="id-form__input"
		                    id="member_email" aria-describedby="emailHelp" name="member_email"
		                    placeholder="이메일을 입력해주세요.">
		            	</div>
		            </div>
		            <button type="submit" class="btn__wrap btn-default">
		               찾기
		            </button>
		
		        <div style="text-align: center; margin-top: 20px;">
					  <a href="/members/login">
					    로그인 바로가기
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