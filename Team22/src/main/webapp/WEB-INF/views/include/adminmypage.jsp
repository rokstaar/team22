<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style type="text/css">
    
 .item ul li {
  margin-left: 0.5em;
}

.item ul li a {
  font-size: 20px;
  font-family: "Noto Sans KR", sans-serif;
  color: #3d4449;
}

 .rightBlue.number {
    color:#3d4449; /* 여기에 원하는 색상을 지정합니다. */
  }


  </style>

</head>
<body>

      <div class="status">									      
									 
									     <div class="item">
									        <div>
									          <div class="rightBlue number"> 
									               <a href="/admin/adminpage?num=1" style="color: #3d4449;">회원 관리 </a> </div>
									        </div>
									      </div>    
									      
									       <div class="item">
									        <div>
									          <div class="rightBlue number"> 거래 관리 </div>
											   <ul>
											   	  <li><a href="/admin/buyprod">물건거래</a></li>
												  <li><a href="/admin/buyau">경매거래</a></li>
												  <li><a href="/admin/buyran">랜덤거래</a></li>
											   </ul>
									        </div>
									      </div>
									       
									      <div class="item">
									        <div>
									          <div class="rightBlue number"> 상품 관리</div>
									           <ul>
											   	  <li><a href="/admin/manageprod?num=1">물건관리</a></li>
												  <li><a href="/admin/manageau">경매관리</a></li>
												  <li><a href="/admin/manageran">랜덤관리</a></li>
											   </ul>												          
									        </div>
									      </div>     
									      
									      <div class="item">
									        <div>
									          <div class="rightBlue number"> 
									              <a href="/admin/managecs?num=1" style="color: #3d4449;">문의사항 관리</a> </div>
									        </div>
									      </div>     
									      
									      <div class="item">
									        <div>
									          <div class="rightBlue number"> 
									              <a href="/admin/managenoti?num=1" style="color: #3d4449;">공지사항 관리</a> </div>
									        </div>
									      </div>          
									    </div>	
									    

</body>
</html>