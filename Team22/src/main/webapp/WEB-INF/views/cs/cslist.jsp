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
   <div style="font-size:x-small;">
    <h1> 고객센터</h1>
   </div> 
     <hr>
      
      <div>
        <h3>안녕하세요,</h3>
        <h3>무엇을 도와드릴까요?(●'◡'●)</h3>       
      </div>

  <div style="float: left; margin-right: 1em;">
    <select name="searchType" style="width: 200px;">
      <option value="title" <c:if test="${dto.searchType eq 'title'}">selected</c:if>>제목</option>
      <option value="writer" <c:if test="${dto.searchType eq 'writer'}">selected</c:if>>작성자</option>
    </select>
  </div> 
 
   <div  style="float: left; margin-right: 1em;">
      <input type="text" name="keyword" value="${dto.keyword}" style="width: 600px;" placeholder="내용을 입력하세요."/>
   </div>  
   <div style="float: left;" >
      <button type="button" id="searchBtn" >검색</button>
   </div> 

   
   <br><br><br>


<script type="text/javascript">
    document.getElementById("searchBtn").onclick = function() {
    	  let searchType = document.getElementsByName("searchType")[0].value;
    	  let keyword =  document.getElementsByName("keyword")[0].value;
    	  
    	  console.log(searchType)
    	  console.log(keyword)
    	  
    	  location.href = "/cs/cslist?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
    };
</script>





		<table class="bbsList">
                <thead class="head">
                    <tr>
                        <th>글번호</th>
                        <th>구분</th>
                        <th>제목</th>
                        <th>작성자</th>   
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
            </table>
            
            <br>

		<div style="text-align: center; font-size: large;">	
				<c:if test="${dto.prev}">
					<span>[ <a href="/cs/cslist?num=${dto.startPageNum - 1}">이전</a> ]  </span>
				</c:if>

				<c:forEach begin="${dto.startPageNum}" end="${dto.endPageNum}" var="num">
						<span> <c:if test="${select != num}">
								<a href="/cs/cslist?num=${num}">${num}</a>
						</c:if> 
					<c:if test="${select == num}">
								<b>${num}</b>
						</c:if>
                      </span>
				</c:forEach>

				<c:if test="${dto.next}">
						<span>[ <a href="/cs/cslist?num=${dto.endPageNum + 1}">다음</a> ]</span>
				</c:if>
		</div>								

			</div>								
											
	 <br><br><br><br><br><br>
	 
	 

	 
	 
	  
	  <div style="text-align: right; font-size: larger;">	
	    <h3 style="text-align: left;">도움이 필요하신가요?</h3>	
		<a href="/cs/cswrite">문의사항 등록</a>
	  </div>	
						
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
			
			