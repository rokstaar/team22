<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 확인하기</title>
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
			<input type="hidden" name="cs_num" value="${csVO.cs_num }"> 
	</form>						

	<article>
		<div class="container" role="main">
			
			<h2>${csVO.cs_sub }</h2>
			     <h5>${csVO.mem_id } &nbsp&nbsp | &nbsp&nbsp ${csVO.cs_category } &nbsp&nbsp | ${csVO.cs_date}</h5>
			 <hr>
			 
				<div class="mb-3">
					<h3> <pre>${csVO.cs_content }</pre> </h3>	
				</div>
				
				<hr>
			
			<div>
                <button type="button" class="btn btn-sm btn-primary" 
                        id="btnList" onclick="location.href='/cs/cslist?num=1';">목록</button>     

            <c:set var="sid" value="${sessionScope.id }"/>  
              <c:if test="${sid == csVO.mem_id }">
                  <button type="button" class="btn btn-sm btn-primary" 
                          id="btnList" onclick="location.href='/cs/csupdate?cs_num=${csVO.cs_num}';">수정</button>               
                  <button type="button" class="btn btn-sm btn-primary" 
                          id="btnList" onclick="location.href='/cs/deletecs?cs_num=${csVO.cs_num}';">삭제</button>        
               </c:if>
                 
         <c:if test="${id != null && id ==('admin')}"> 
           <button type="button" class="btn btn-sm btn-primary" id="btnList" 
                   onclick="location.href='/cs/csRewrite?cs_num=${csVO.cs_num}&cs_ref=${csVO.cs_ref }&cs_lev=${csVO.cs_lev }&cs_seq=${csVO.cs_seq}';">답글 쓰기</button>
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