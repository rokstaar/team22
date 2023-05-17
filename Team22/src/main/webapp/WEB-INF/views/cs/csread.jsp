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
			<input type="hidden" name="cs_process" value="${csVO.cs_process}"> 
	</form>						

	<article>
		<div class="container" role="main">
			
			<h2>${csVO.cs_sub }</h2>
			     <h5>${csVO.mem_id } &nbsp&nbsp | &nbsp&nbsp ${csVO.cs_category } &nbsp&nbsp | ${csVO.cs_date}</h5>
			 <hr>
			 
				<div class="mb-3">
					<h3> <pre>${csVO.cs_content }</pre> </h3>	
					<img alt="" src="${csVO.cs_file0 }" style="width: 700px; height: 400px;" onerror="this.style.display='none'"> <br>
					<img alt="" src="${csVO.cs_file1 }" style="width: 700px; height: 400px;" onerror="this.style.display='none'"> <br>
					<img alt="" src="${csVO.cs_file2 }" style="width: 700px; height: 400px;" onerror="this.style.display='none'"> <br>
				</div>
				
				<hr>
			
       
       <c:forEach var="relist" items="${reList }" >
           <li>
             <div>
                <h4> <pre> ${relist.re_content }</pre> </h4> 
                <h4> <pre>${relist.re_date }</pre> </h4> 
        
        <c:if test="${id != null && id ==('admin')}" >                       
                  <a href="/reply/remodify?cs_num=${csVO.cs_num }&re_rno=${relist.re_rno}">수정</a> 
                  <a href="/reply/redelete?cs_num=${relist.cs_num}&re_rno=${relist.re_rno}">삭제</a>     
         </c:if>        
             </div>          
           </li>
       </c:forEach>
       
     <div style="text-align: center;">
         <button type="button" class="btn btn-sm btn-primary" 
                        id="btnList" onclick="location.href='/cs/cslist?num=1';">목록</button>     

          <c:set var="sid" value="${sessionScope.id }"/>  
              <c:if test="${sid == csVO.mem_id }">
                  <button type="button" class="btn btn-sm btn-primary" 
                          id="btnList" onclick="location.href='/cs/csupdate?cs_num=${csVO.cs_num}';">수정</button>               
                  <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="confirmDelete('${csVO.cs_num}')">삭제</button>                  
            </c:if>              
    </div>     
                 
         <hr>  
       
    <c:if test="${id != null && id ==('admin')}"> 
         <form method="post" action="/reply/rewrite" class="reform">
              <div>
                <textarea name="re_content" rows="5" cols="50" ></textarea> <br>
               
               <input type="hidden" name="cs_num" value="${csVO.cs_num}">
               <input type="hidden" name="cs_process" value="${csVO.cs_process }" >
               <button type="submit" class="reyes_btn" onclick="reply()">답글 작성하기</button>
              </div>
          </form>      
    </c:if>
    


 <script>
function confirmDelete(csNum) {
  if (confirm("정말로 삭제하시겠습니까?")) {
    // 삭제 확인 시 진행할 로직
    deleteNotification(csNum);
  }
}

function deleteNotification(csNum) {
  // 삭제 처리를 위한 Ajax 요청이나 서버로의 전송 로직을 작성합니다.
  // 여기서는 location.href로 페이지 이동하는 예시를 드리겠습니다.
  location.href = `/cs/deletecs?cs_num=${csVO.cs_num}`;
}

   function reply(){
	   if(confirm("등록하시겠습니까?")){
			alert("정상적으로 등록되었습니다.");
		}else{
			alert("등록실패");
		}
   } 


</script>     
    
        
           
        
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