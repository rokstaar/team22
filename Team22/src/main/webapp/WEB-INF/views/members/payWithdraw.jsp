<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/assets/css/login.css" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
<!-- 네이버아이디로 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
</head>
<body>

  <!-- header -->

    <!-- sign-in -->
    <div class="sign-in">
    
      <form id="myForm" role="form" method="POST">
        
      
        <h2 class="sign-in__title">페이 출금</h2>

        <div class="id-form__wrap">
          <label for="id">${memberInfo.member_nickname }님의 페이 금액은 ${memberInfo.member_pay }원 입니다.</label>
          <br />
        </div>
      
	        <label for="bank">은행:</label>
			<select name="bank" id="bank-select" class="select_filter">
			  <option value="" hidden>은행 선택</option>
			  <option value="부산">부산은행</option>
			  <option value="신한">신한 은행</option>
			  <option value="우리">우리 은행</option>
			  <option value="국민">국민 은행</option>
			  <option value="카카오">카카오 뱅크</option>
			  <option value="농협">농협</option>
			</select>
			<br>
			
			<label for="account_number">계좌 번호: 
			  <input type="text" name="account_number" style="background-color: #e2e2e2;" 
			    oninput="validateInput(this, 'error_message_account')">
			  <br>
			  <span id="error_message_account" style="color: red; display: none;">숫자를 입력해주세요.</span>
			</label>
			
			<br>
			
			<label for="withdraw_amount">출금 금액:
			  <input type="text" name="withdraw_amount" style="background-color: #e2e2e2;" 
			    oninput="validateInput(this, 'error_message_withdraw')">
			  <br>
			  <span id="error_message_withdraw" style="color: red; display: none;">숫자를 입력해주세요.</span>
			</label>
			
			<br>
			
	<input type="hidden" name="member_id" value="${memberInfo.member_id }">			
	<input type="hidden" name="member_nickname" value="${memberInfo.member_nickname }">			
			 <div class="my-page__edit-buttons">
		                <input type="button" class="pay_withdraw_amount" value="출금" onclick="validateForm()">

					            </div>
       </form>

    </div>
      
      
   <script>
   function validateInput(input, errorId) {
	    var sanitizedValue = input.value.replace(/[^0-9]/g, '');
	    if (input.value !== sanitizedValue) {
	      document.getElementById(errorId).style.display = 'inline';
	    } else {
	      document.getElementById(errorId).style.display = 'none';
	    }
	    input.value = sanitizedValue;
	  }
	  
	  function validateForm() {
	    var bankSelect = document.getElementById('bank-select');
	    var accountNumberInput = document.getElementsByName('account_number')[0];
	    var withdrawAmountInput = document.getElementsByName('withdraw_amount')[0];
	    
	    if (bankSelect.value === '' || accountNumberInput.value === '' || withdrawAmountInput.value === '') {
	      alert('은행과 계좌 번호, 출금 금액을 입력해주세요.');
	    } else if (parseInt(withdrawAmountInput.value) > parseInt("${memberInfo.member_pay}")) {
	        alert('출금 금액이 현재 페이 금액보다 큽니다.');
	    } else {
	    	document.getElementById('myForm').submit();
	    }
	  }
</script>
</body>
</html>