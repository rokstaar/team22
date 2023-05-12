<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.sign-in__title {
    text-align: center;
    font-family: "Noto Sans KR", sans-serif;
    font-weight: 600;
    font-size: 35px;
    margin-bottom: 30px;
}

.email-form__input {
display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 40px;
    line-height: 1.42857143;
    color: #000;
    background-color: #fff;
    background-image: none;
    border-radius: 6px;
    font-family: "Noto Sans KR", sans-serif;
    font-weight: 500;
    margin-bottom: 100px;
}


.btn-default {
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    background-color: #3f72af;
    font-weight: 600;
    font-size: 18px;
    display: block;
    width: 375px;
    height: 40px;
    line-height: 1.42857143;
    border-radius: 8px;
    font-family: "Noto Sans KR", sans-serif;
    cursor: pointer;
    margin: auto;
    margin-top: 10px;
}
    .btn-default:hover {
  background-color: #f56a6a;
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


</style>

<script type="text/javascript">

	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}

</script>
</head>
<body>


    <div class="find_id_box">
               
            <div class="sign-in__title">
 
		  <form class="user">
      <div class="form-group">
        <c:forEach var="m" items="${member}">
      
          <p class="email-form__input">
     ${m.member_name} 님의  아이디는: ${m.member_id}  입니다.</p>
           
        </c:forEach>
      </div>
    </form>
			</div>
  <button type="button" class="btn-default" onclick="location.href='/members/login'">로그인페이지</button>
  <button type="button" class="btn-default" onclick="location.href='/main'">메인페이지</button>
  
  
</div>
   


</body>
</html>