<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>           
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
  charset="utf-8"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var name = "${name}";
	var email = "${email}";
	$("#name").html(name);
	$("#email").html(email);
  });
</script>

</head>
<body>
 
  <script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(1000);  // 1초 뒤에 사라 지자 
     
      setTimeout(function(){
    	  $("body").fadeOut(1000);
    	  }, 1000);
      setTimeout(function(){
    	  location.href= "${pageContext.request.contextPath}/"
    	  }, 2000);
// 2초 뒤에 메인 화면 으로 가자  
    
    })
  </script>

</body>
</html>