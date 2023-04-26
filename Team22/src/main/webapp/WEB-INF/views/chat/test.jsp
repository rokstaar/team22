<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
  <h1>채팅 테스트</h1>
  
  <form action="/chatroom" method="POST">
    상품번호 : <input type="text" name="product_num"> <br>
   	판매자: <input type="text" name="seller"> <br>
    <input type="submit" value="채팅하기">
  </form>
    아이디 : ${sessionScope.id } <br>
    
</body>
</html>