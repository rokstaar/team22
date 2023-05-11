<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <div class="status">									      
									       <div class="item">
									        <div>
									           <img alt="프로필사진" src="/resources/img/profile.png" width="150px" height="100px" >
									        </div>
									      	
									        
									        <div>
									          <div class="text">관리자</div>
									        <div class="memberUpdate"> 회원정보수정</a></div>
									        </div>
									      </div>
									      <div class="item">
									        <div>
									          <div class="rightBlue number"> <a href="/admin/adminpage?num=1">회원 관리 </a> </div>
									          <div class="text">총 회원 : ${mcount }명</div>
									        </div>
									      </div>    
									      
									       <div class="item">
									        <div>
									          <div class="rightBlue number"> <a href="/admin/managetrade">거래내역 관리 </a> </div>
									          <div class="text">총 거래수 : ${tradecount }</div>
									        </div>
									      </div>
									       
									      <div class="item">
									        <div>
									          <div class="rightBlue number"> <a href="/admin/manageprod">상품 관리</a> </div>
									          <div class="text">총 상품 : ${procount}개</div>									          
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									          <div class="rightBlue number"> <a href="/admin/managecs?num=1">문의사항 관리</a> </div>
									          <div class="text">총 문의사항 : ${cscount}개</div>	
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									          <div class="rightBlue number"> <a href="/admin/managenoti?num=1">공지사항 관리</a> </div>
									          <div class="text">총 공지사항 : ${noticount}개</div>	    
									        </div>
									      </div>          
									    </div>	
									    









</body>
</html>