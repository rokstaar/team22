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
  
</head>
<body>

  <!-- header -->

    <!-- sign-in -->
    <div class="sign-in">
    
      <form
        class="sign-in__wrap"
        id="join"
        action="/members/myPage"
        method="get"
        name="joinform"
      >
        <h2 class="sign-in__title">충전확인</h2>

        <div class="id-form__wrap">
          <label for="id">${memberInfo.member_nickname }님의 충전 금액은 ${amount }원 입니다.</label>
          <br />
        </div>
       
        <div class="id-form__wrap">
          <label for="id">${memberInfo.member_nickname }님의 충전 후 잔액은 ${memberInfo.member_pay }원 입니다.</label>
          <br />
        </div>

        <!-- btn -->
        <button type="submit" class="btn__wrap btn-default">
          <p class="sign-in__btn">확인</p>
        </button>
        

       </form>

    </div>
      
</body>
</html>