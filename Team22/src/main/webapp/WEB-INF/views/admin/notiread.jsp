<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 확인하기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
		<link rel="stylesheet" href="/resources/assets/css/styles.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

	<!-- Header -->
      <%@ include file="../include/header.jsp" %>		
																
							<!-- Banner -->
							<section id="banner">
								 <div class="content">
								 <div class="wrap">
									  <div class="shippingStatusContainer">

	<form role="form" method="post">
			<input type="hidden" name="noti_num" value="${resultVO.noti_num }"> 
		</form>						

									<!-- board seach area -->
				<article>
		<div class="container" role="main">
		
			<h2>${resultVO.noti_title }</h2>
			  <hr>
			  <div class="mb-3">
					<h3> <pre>${resultVO.noti_content }</pre> </h3>	
							 
			  <img alt="" src="${resultVO.noti_image }" style="width: 600px; height: 500px;" onerror="this.style.display='none'"> <br>
			  <img alt="" src="${resultVO.noti_image1 }" style="width: 600px; height: 500px;" onerror="this.style.display='none'"> <br>
			  <img alt="" src="${resultVO.noti_image2 }" style="width: 600px; height: 500px;" onerror="this.style.display='none'"> <br>
			</div>	
				
				<hr>
			
			<div style="text-align: center;">
                <button type="button" class="btn btn-sm btn-primary" 
                        id="btnList" onclick="location.href='/admin/notice?num=1';">목록</button>
          <c:if test="${id != null && id ==('admin')}">     
                <button type="button" class="btn btn-sm btn-primary" 
                        id="btnList" onclick="location.href='/admin/notimodify?noti_num=${resultVO.noti_num}';">수정</button>
               <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="confirmDelete('${resultVO.noti_num}')">삭제</button>      
          </c:if>              
           
           </div>
        </div>
	</article>

				 </div>  
				</div>	   
             </div>
		</div>
</section>
                
  <script>
function confirmDelete(notiNum) {
  if (confirm("정말로 삭제하시겠습니까?")) {
	  alert("정상적으로 삭제되었습니다.");
  }
}

function deleteNotification(notiNum) {
  // 삭제 처리를 위한 Ajax 요청이나 서버로의 전송 로직을 작성합니다.
  // 여기서는 location.href로 페이지 이동하는 예시를 드리겠습니다.
  location.href = `/admin/deletenoti?noti_num=${resultVO.noti_num}`;
}
</script>         
                
                
                
                
                   
            </div>
			      <%@ include file="../include/sidebar.jsp" %>		
			 </div>
			 
		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>
			
</body>
</html>			