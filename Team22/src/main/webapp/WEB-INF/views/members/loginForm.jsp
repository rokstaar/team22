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
    
      <form
        class="sign-in__wrap"
        id="join"
        action="/members/login"
        method="post"
        name="joinform"
      >
        <h2 class="sign-in__title">로그인</h2>

        <!-- id -->
        <div class="id-form__wrap">
          <label for="id">아이디</label>
          <br />
          <div class="id-form">
            <input
              type="text"
              id="id"
              name="member_id"
              class="id-form__input"
              placeholder="아이디"
              value="${not empty param.member_id ? param.member_id : ''}"
              required=""
              minlength="4"
              maxlength="12"
            />
          </div>
        </div>

        <!-- password -->
        <div class="password-form__wrap form--margin">
          <label for="pwd">비밀번호</label>
          <br />
          <input
            type="password"
            id="pwd"
            name="member_pass"
            class="ps-form__input form--margin-top"
            placeholder="비밀번호"
            required=""
          />
        </div>

        <!-- btn -->
        <button type="submit" class="btn__wrap btn-default">
          <p class="sign-in__btn">로그인</p>
        </button>
        
        <c:if test="${not empty errorMessage}">
   			<script>
    			alert("${errorMessage}");
    		</script>
		</c:if>
        
        
        <!-- sign-in-info__list -->
        <ul class="sign-in-info__list">

            <li>
              <a href="/members/insert">회원가입</a>
            </li>

          
          <div class="forgot-id-ps__list">
            <li>
              <a href="/members/findIdView">아이디 찾기</a>
            </li>
            <div class="forgot-id-ps__list-divider"></div>
            <li>
              <a href="/members/findPassword">비밀번호 찾기</a>
            </li>
          </div>
          
        </ul>

		<!-- 네이버 로그인 버튼 -->
		<div id="naver_id_login" style="text-align:center">
			<a href="${naverurl}">
			<img width="200" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
		</div>

       </form>
       
       
    </div>
      
</body>
</html>