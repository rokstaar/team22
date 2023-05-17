<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

   <style>
        .con {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .tit {
            font-size: x-large;
            margin: 0;
        }

        .button {
            float: right;
        }
        
        
.cs-process.completed {
  color: #f56a6a;
  font-weight: 500;
}
        
        
        
    </style>


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
							    <h2 style="margin: 0 0 0 0; font-size: 3em; text-align: center;"> 고객센터</h2>
							      <h3 style="text-align: center; margin-top: 0.5em;">안녕하세요, 무엇을 도와드릴까요?(●'◡'●) </h3>
							   <div class="wrap">
								<div class="shippingStatusContainer">


																	
   <div class="container managergrounp" id="container" name="container" > 
     <hr>
      <div>
        
      </div>

 <div style="margin-left: 20em;"> 
  <div style="float: left; margin-right: 0.3em;">
    <select name="searchType" style="width: 110px; border-radius: 1.5em; text-align: center;">
      <option value="title" <c:if test="${dto.searchType eq 'title'}">selected</c:if>>제목</option>
      <option value="writer" <c:if test="${dto.searchType eq 'writer'}">selected</c:if>>작성자</option>
    </select>
  </div> 
 
   <div  style="float: left; margin-right: 0.1em;">
      <input type="text" name="keyword" value="${dto.keyword}" style="width: 550px; border-radius: 1.5em" placeholder="무엇을 도와드릴까요?"/>
   </div>  
   <div style="float: left; margin-left: 0.03em;" >
      <button style="border-radius: 2em" type="button" id="searchBtn" >검색</button>
   </div> 
</div>
   
   <br><br><br><br><br>


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
                        <th>답변여부</th>
                        <th>제목</th>
                        <th>작성자</th>   
                        <th>등록일</th>    
                    </tr>    
                </thead>
                <tbody class="body">
                  
                   <c:forEach var="blist" items="${boardList}">	
                     <input type="hidden" name="mem_id" value="${blist.mem_id}">
                    <tr>
                       <td>${blist.cs_num }</td>                       
                        <td>${blist.cs_category}</td>
                        <td>${blist.cs_process}</td>
                        <td>
                          <span class="cs-process${blist.cs_process eq '답변완료' ? ' completed' : ''}">
                             ${blist.cs_process}
                           </span>
                        </td>          
                        <td>
                           <a href="/cs/csread?cs_num=${blist.cs_num}">${blist.cs_sub }</a>
                        </td>  

						<td>${blist.mem_id}</td>
                        <td>${blist.cs_date }</td>                                                                                                                             
                    </tr>                 
                </c:forEach>	                   
                </tbody>
            </table>
            
            <br>

		<div style="text-align: center; font-size: large;">	
				<c:if test="${dto.prev}">
					<span>[ <a href="/cs/cslist?num=${dto.startPageNum - 1}${dto.searchTypeKeyword}">이전</a> ]  </span>
				</c:if>

				<c:forEach begin="${dto.startPageNum}" end="${dto.endPageNum}" var="num">
						<span> <c:if test="${select != num}">
								<a href="/cs/cslist?num=${num}${dto.searchTypeKeyword}">${num}</a>
						</c:if> 
					<c:if test="${select == num}">
								<b>${num}</b>
						</c:if>
                      </span>
				</c:forEach>

				<c:if test="${dto.next}">
						<span>[ <a href="/cs/cslist?num=${dto.endPageNum + 1}${dto.searchTypeKeyword}">다음</a> ]</span>
				</c:if>
		</div>								

			</div>								
											
	 <br><br><br><br><br><br>
	 	 
		
     <div class="con">
        <h3 class="tit">도움이 필요하신가요?</h3>
        <input type="button" value="문의사항 등록" class="button" onclick="location='/cs/cswrite';">
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
			
			