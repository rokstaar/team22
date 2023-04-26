<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/styles.css" />
<link rel="stylesheet" type="text/css" href="/resources/assets/css/membersignup.css" />
<script>

function fn_idChk(){
	$.ajax({
		url : "/members/idChk",
		type : "post",
		dataType : "text",
		data : {"member_id" : $("#member_id").val()},
		success : function(data){
			if(data == "1"){
				alert("중복된 아이디입니다.");
			}else if(data =="0"){
				$("#idChk").attr("value","Y");
				alert("사용가능한 아이디 입니다.");
			}
		}
	})
}
    
    // 비밀번호 확인 함수
    function checkPassword() {
        var password = document.getElementById('pwd').value;
        var passwordConfirm = document.getElementById('pwdcheck').value;
        var message = document.getElementById('password-message');
        if (password != passwordConfirm) {
            message.style.display = 'block';
            return false;
        } else {
            message.style.display = 'none';
            return true;
        }
    }

    // 폼 제출 시 비밀번호 확인 실행
    document.getElementById('my-form').addEventListener('submit', function(e) {
        if (!checkPassword()) {
            e.preventDefault(); // 폼 제출 취소
        }
    });
    
</script>   

</head>
<body>

		<div class="main-content">	

			<h2 class="member-title text-center">회원가입</h2>

			<!-- Form 시작 -->
			<form class="form-signup" id="join" method="post" name="joinform">

				<!-- 닉네임 -->
				<div class="form-label-group">
					<label for="nickname">닉네임</label>
					<br>
					<div class="form-input-box">
						<input type="text" id="nickname" name="member_nickname" class="form-control" placeholder="닉네임" required=""> 
						<button type="submit" class="btn btn-info btn-sm">중복확인</button>
					</div>
					
				</div>

				<!-- 아이디 -->
				<div class="form-label-group">
					<label for="id">아이디</label>
					<br>
					<div class="form-input-box">
						<input type="text" id="member_id" name="member_id" class="form-control" placeholder="아이디" required=""> 
						<button type="button" class="btn btn-info btn-sm" id="btnIdChk" onclick="fn_idChk();" value="N">중복확인</button>	
					</div>
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-label-group">
					<label for="pwd">비밀번호</label>
					<br>
					<input type="password" id="pwd" name="member_pass" class="form-control form-margin-top" placeholder="비밀번호" required=""> 
				</div>
				<div class="form-label-group">
					<label for="pwdcheck">비밀번호 재확인</label>	
					<br>						
					<input type="password" id="pwdcheck" name="confirm-password" class="form-control form-margin-top" placeholder="비밀번호 재확인" required="">
				</div>
				
				<span id="password-message" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</span>
				
				<div class="form-label-group">
					<label for="member_name">이름</label>
					<br>
					<input type="text"  id="member_name" name="member_name" class="form-control form-margin-top" placeholder="이름"> 
				</div>
				
				<div class="form-label-group">
					<label for="addr">주소</label>
					<br>
					<input type="text" name="member_address" class="form-control form-margin-top" placeholder="주소"> 
				</div>
			
				<!-- 문제의 input 부분 -->
				<div class="form-label-group">
					<label for="email">이메일</label>
					<br>		
					<input type="email" id="email" name="member_email" class="form-control form-margin-top" placeholder="이메일"> 
				</div>
							
				<div class="form-label-group btn-sign-up-margin">
					<label for="phone">휴대전화</label>
					<br>	
					<input type="text" id="phone" name="member_phone" class="form-control form-margin-top" placeholder="휴대전화" required=""> 
				</div>
				
				
				
				<button type="submit" class="btn btn-default">
					<p class="btn-sign-up">
						가입하기
					</p>
				</button>
		
			</form>
		</div>

</body>
</html>