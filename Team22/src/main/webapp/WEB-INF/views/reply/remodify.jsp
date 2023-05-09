<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 수정하기</title>
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
		
	<article>
		<div class="container" role="main">
		  <h2>답글 수정하기</h2>	
			
         <hr>  
       
    <c:if test="${id != null && id ==('admin')}"> 
         <form method="post" action="/reply/remodify">
              <div>
                <textarea name="re_content" rows="5" cols="50" >${rvo.re_content }</textarea> <br>
               
               <input type="hidden" name="cs_num" value="${rvo.cs_num}">
               <input type="hidden" name="re_rno" value="${rvo.re_rno}" >
               <button type="submit" class="reyes_btn">댓글 수정하기</button>
              </div>
          </form>      
    </c:if>
    

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