<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/styles.css" />
<link rel="stylesheet" type="text/css" href="/resources/assets/css/membersignup.css" />



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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


<script>
///////////////////////////////////////   아이디   ///////////////////////////////////////////////
//아이디 유효성 검사 함수
function validateId(id) {
  let idRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
  return idRegex.test(id);
}

// 중복 체크 함수
function checkIdDuplicate() {
  let id = $('#id').val();

  if (!validateId(id)) {
    $("#idcheck_blank").css("color", "red");
    $("#idcheck_blank").text("아이디는 8~16자의 영문과 숫자 조합이어야 합니다.");
    return;
  }

  $.ajax({
    url: "idCheck",
    type: "POST",
    data: JSON.stringify(id),
    contentType: "application/json; charset=UTF-8",
    dataType: "JSON",
    success: function(data) {
      if (data) {
        $("#idcheck_blank").css("color", "red");
        $("#idcheck_blank").text("중복된 아이디입니다.");
        $("#id").val("");
      } else {
        $("#idcheck_blank").css("color", "blue");
        $("#idcheck_blank").text("사용 가능한 아이디입니다.");
      }
    }
  });
}
///////////////////////////////////////   아이디   ///////////////////////////////////////////////

//////닉네임 중복 검사////////
function check_nick(){
	var nickCheck=0;
	var inputed =$('#nickname').val();
	
	$.ajax({
		data : inputed,
		url : "nickCheck",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data){
				$("#nickcheck_blank").css("color", "red");
		    	$("#nickcheck_blank").text("중복된 닉네임입니다.");
		    	nick_check = false;
		    	$("#nickname").val("");
				
			}else{
				$("#nickcheck_blank").css("color", "blue");
		    	$("#nickcheck_blank").text("사용가능한 닉네임입니다.");
				}
			}
	});
};





////////////////////////////// 주소    //////////////////////////////////////////////////
function exePost() {
	 new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           //바꿔줘야 하는 부분~
           $("[name=member_address]").val(data.zonecode);
           $("[name=m_address_primary]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
//////////////////////////////주소    //////////////////////////////////////////////////
function exePost() {
	 new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           //바꿔줘야 하는 부분~
           $("[name=member_address]").val(data.zonecode);
           $("[name=member_address2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
//////////////////////////////주소    //////////////////////////////////////////////////


//////////////////////////  이메일 ///////////////////////////////

/**
 *  회원가입 관련 처리
 */
 
 

</script>   

</head>
<body>

		<div class="main-content">	

			<h2 class="member-title text-center">회원탈퇴</h2>

			<!-- Form 시작 -->
			<form class="form-signup" id="join" method="post" name="joinform" role="form" enctype="multipart/form-data">
			<input type="hidden" name="member_num" value="${memberInfo.member_num }">
			<input type="hidden" name="member_pay" value="${memberInfo.member_pay }">
				<!-- 닉네임 -->
				<div class="form-label-group">
					<label for="nickname">닉네임</label>
					<br>
					<div class="form-input-box">
						<input type="text" id="nickname" name="member_nickname" class="form-control" readonly value="${memberInfo.member_nickname }" required=""> 
					</div>
					<span id="nickcheck_blank"></span>
					
				</div>

				<!-- 아이디 -->
				<div class="form-label-group">
					<label for="id">아이디</label>
					<br>
					<div id="id_Confirm" class="form-input-box">
						<input type="text" id="id" name="member_id" class="form-control"  value="${memberInfo.member_id }" readonly maxlength="16" size="30" required=""> 
					</div>
					<span id="idcheck_blank"></span>
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-label-group">
					<label for="pwd">비밀번호</label>
					<br>
					<input type="password" id="pw" name="member_pass" class="form-control form-margin-top" placeholder="비밀번호 입력" size="30" maxlength="16" required=""> 
				</div>
						<span id="pwdcheck_blank1"></span>
				
				<tr>
		<td></td><td colspan="2" style="font-size: 3px" id="pwdcheck_blank1"></td>
	</tr>
				
				
				
				<div class="form-label-group">
					<label for="member_name">이름</label>
					<br>
					<input type="text"  id="name" name="member_name" class="form-control form-margin-top" readonly value="${memberInfo.member_name }" readonly required> 
				</div>
				
				

				 <div class="form-label-group btn-sign-up-margin">
					<label for="phone">연락처</label>
					<br>	
					<input  type="text" id="phone" name="member_phone" class="form-control form-margin-top"  readonly value="${memberInfo.member_phone }" required=""> 
				</div>
				 <div class="form-label-group btn-sign-up-margin">
					<label for="phone">이메일</label>
					<br>	
					<input type="text" id="email" name="member_email" class="form-control form-margin-top" readonly value="${memberInfo.member_email }" required=""> 
				</div>
				 
				
				
				<button type="submit" class="btn btn-default">
					<p class="btn-sign-up">
						회원탈퇴
					</p>
				</button>
			</form>
			
		</div>
</body>
</html>
