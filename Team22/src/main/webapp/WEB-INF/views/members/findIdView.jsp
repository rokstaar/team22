<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
            <h1 class="sign-in__title">아이디 찾기</h1>
     
        <form class="user" action="/members/findId" method="POST">
            <div class="form-group">
                <input type="email" class="email-form__input"
                    id="member_email" aria-describedby="emailHelp" name="member_email"
                    placeholder="이메일을 입력해주세요!">
            </div>
            <button type="submit" class="btn-default">
               찾기
            </button>
        </form>
        
      <ul class="sign-in-info__list">
        <li>
        <a href="/members/login" class="findIdLogin">
               로그인페이지
        </a>
         </li>  
       <li> 
            <a class="findIdMain" href="/main">메인페이지</a>
      </li>
       </ul>
   </div>
   
   


</body>
</html>