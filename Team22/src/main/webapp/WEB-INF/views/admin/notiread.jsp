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
				</div>
				
				<hr>
			
			<div>
                <button type="button" class="btn btn-sm btn-primary" 
                        id="btnList" onclick="location.href='/admin/notice';">목록</button>
          <c:if test="${id != null && id ==('admin')}">     
                <button type="button" class="btn btn-sm btn-primary" 
                        id="btnList" onclick="location.href='/admin/notimodify?noti_num=${resultVO.noti_num}';">수정</button>
                <button type="button" class="btn btn-sm btn-primary" 
                        id="btnList" onclick="">삭제</button>        
          </c:if>              
           
           </div>
        </div>
	</article>

				 </div>  
				</div>	   
             </div>
		</div>
</section>
                   
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