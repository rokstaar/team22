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
    font-weight: 900;
    font-size: 34px;
    margin-bottom: 30px;
}

.email-form__input {
    display: block;
    width: 100%;
    height: 34px;
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

}
.btn-default {
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    background-color: #3f72af;
    font-weight: 500;
    font-size: 16px;
    display: block;
    width: 100%;
    height: 30px;
    line-height: 1.42857143;
    border-radius: 8px;
    font-family: "Noto Sans KR", sans-serif;
    cursor: pointer;
    margin-top: 5px;
}

.forgot-id-ps__list {
    display: flex;
    gap: 15px;
}
.find_id_box{
position: absolute;
    top: 30%;
    left: 40%;
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
                Find ID
            </button>
        </form>
        <hr>
      
        <a href="/members/login" class="btn btn-facebook btn-user btn-block">
               Login
            </a>
            <hr>
           <div class="text-center">
            <a class="small" href="/main">메인페이지</a>
        </div>
   </div>


</body>
</html>