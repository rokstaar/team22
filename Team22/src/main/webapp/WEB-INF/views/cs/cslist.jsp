<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>

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
            <h3> 문의 사항 </h3>
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
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>글쓴이</th>   
                        <th>등록일</th>    
                    </tr>    
                </thead>
                <tbody class="body">
                  
                  <c:forEach var="blist" items="${boardList}">	 
                     <input type="hidden" name="mem_id" value="${blist.mem_id}">
                    <tr>
                       <td class="">${blist.cs_num }</td>                       
                        <td class="">${blist.cs_category}</td>
                                
                        <td class="">
                          <a href="/cs/csread?cs_num=${blist.cs_num}"> ${blist.cs_sub } </a>
                        </td>
                       
                        <td class="">${blist.mem_id}</td>
                        <td class="">${blist.cs_date }</td>                                                                                                                             
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
											
		
			<a href="/cs/cswrite">문의사항 등록</a>
	
											
									

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
			
			