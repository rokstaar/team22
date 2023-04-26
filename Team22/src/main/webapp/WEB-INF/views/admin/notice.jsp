<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
		<link rel="stylesheet" href="/resources/assets/css/styles.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<link href="/resources/assets/css/notice.css" rel="stylesheet"/>
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


																	
   <div class="container managergrounp" id="container" name="container" >
            <h3> 공지 사항 </h3>
            <hr>         		
<!--             <div class="right">
                <select class="select_btn">
                    <option value="">10개씩 보기</option>    
                </select>
            </div> -->

            <table class="bbsList">
                <thead class="head">
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>   
                        <th>등록일</th>
                        <th>조회수</th>     
                    </tr>    
                </thead>
                <tbody class="body">
                  <c:forEach var="nlist" items="${noticeList}">	 
                    <tr>
                        <td class="">${nlist.noti_num }</td>
                        <td class="">
                          <a href="/admin/notiread?noti_num=${nlist.noti_num}">
                            ${nlist.noti_title }
                          </a>
                         </td>
                        <td class="">${nlist.noti_date }</td>    
                        <td class="">${nlist.noti_readcount }</td>                                                                 
                    </tr> 
                </c:forEach>	                   
                </tbody>
                <tfoot class="foot">
                    <tr>
                        <td colspan="9">
                            <span class="arrow radius-right">≪</span>
                            <span class="arrow radius-left">＜</span>
                            
                            <a href="javascript:;" class="num_box txt_point">1</a>
                            <a href="javascript:;" class="num_box ">2</a>
                            <a href="javascript:;" class="num_box ">3</a>

                            <span class="arrow radius-right">＞</span>
                            <span class="arrow radius-left">≫</span>
                        </td>
                    </tr>    
                </tfoot>
            </table>
        </div>								
											
			<c:if test="${id != null && id ==('admin')}">	
					<a href="/admin/noticewrite">공지사항 등록</a>
			</c:if>		
											
									

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
			
			