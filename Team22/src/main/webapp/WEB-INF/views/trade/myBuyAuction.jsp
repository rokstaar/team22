<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">
 h1{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 30px; 
         color: #216182; 
     } 
     label { 
         display: block; 
         margin-top: 20px; 
         letter-spacing: 2px; 
     } 

input, textarea { 
         width: 439px; 
         height: 27px; 
         background-color: #efefef; 
         border-radius: 6px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
     }

input:focus, textarea:focus{ 
             border: 1px solid #97d6eb; 
         } 
         
textarea{ 
         height: 60px; 
         background-color: #efefef; 
     } 
#submit{ 
         width: 80px; 
         /* height: 48px; */ 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
#cancel { 
         width: 80px; 
         /* height: 48px;  */
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     
.modal { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
.close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
} 

.modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 500px; 
         /* height: 300px; */ 
         border-radius: 0.5rem; 
         text-align: center;
         /* display: flex;
  		justify-content: center; */
     } 
.close-button:hover { 
       background-color: darkgray; 
       font-weight: bold;
} 
.show-modal { 

         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
}
.script{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  text-decoration: none;
  color: 769fcd;
  font-weight: bold;
  }
  
#rv_score{
	width: 130px;
	margin: 5% 36% 0;
	text-align: center;
	font-weight: bold;
	font-family: "Noto Sans KR", sans-serif;
}

#rv_score:hover {
  background-color: #eaeaea;
}

</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

	<!-- Main -->
	<div id="main">
		<div class="inner">

		<!-- Header -->
		<%@ include file="../include/header.jsp" %>
		<%@ include file="../include/myPage.jsp" %>			
										
			<div class="infoContainer">
				<a href="/trade/buyList" class="item">구매내역</a> 
			</div>
			
			<div class="info">
				<button class="button" 
						onclick="location.href='/trade/buyList'">일반</button>
				<button class="button" 
						onclick="location.href='/trade/myBuyAuction'">경매</button>
				<button class="button" 
						onclick="location.href='/trade/myBuyRandom'">응모</button>
			</div>
								  
			<section>
				<article>
					
					<div class="shippingStatusContainer">
						<table class="bbsList">
							<%-- <c:if test="${vo.buy_mem_id eq sessionScope.id }"> --%>
								<thead class="head">
									<tr>
										<th>상품</th>
										<th>카테고리</th>
										<th>상품명</th>
										<th>가격</th>
										<th>판매자</th>
									</tr>
								</thead>
								<tbody class="body">
									<c:forEach var="vo" items="${myBuyAuction }">
									<tr>
								<td><img src="/auction/download?fileName=${vo.au_pic.replace('[','').replace(']','').split(',')[0]} "  
									        onerror="this.src='/resources/images/default_product.jpg'" width="80px" height="60px"></td>
										<td>
											${vo.au_category }
										</td>
										<td>
										  <span onclick="window.location.href='/auction/aDetail?au_num=${vo.au_num }'">
										    ${vo.au_title }
										  </span>
										</td>
										<td>
											<fmt:formatNumber value="${vo.au_bidPrice }" pattern="#,###" />원
										</td>
										<td>
										  <span onclick="window.location.href='/members/memberInfo?mem_id=${vo.au_sellerId }'">
										   ${vo.au_sellerId }
										  </span>
										</td>
									     <td>
											<div class="script">
						         				<button class="trigger">구매후기 작성</button>      
								   				<div class="modal"> 
								        			<div class="modal-content"> 
								             			
								          					<form action="/trade/reviewInsert" method="POST">
								               					<h2 style="margin-top: 20px;">${vo.member_nickname }님에게 작성하기</h2> 
								              						
								              					<textarea name="rv_content" placeholder="메세지를 입력하세요." required="required"></textarea> 
								              					<select name="rv_score" id="rv_score">
																	<option>평점 선택</option>
																	<option value="5">5</option>
																	<option value="4">4</option>
																	<option value="3">3</option>
																	<option value="2">2</option>
																	<option value="1">1</option>
																	<option value="0">0</option>
																</select>
																<input type="hidden" name="reviewee" value="${vo.au_sellerId}">
																<input type="hidden" name="reviewer" value="${vo.buy_mem_id}">
																<input type="hidden" name="au_num" value="${vo.au_num}">
													         	<input type="button" id="cancel" value="취소" onclick="location.href='/trade/myBuyAuction" > 
													         	<input type="submit" id="submit" value="작성"> 
				
								             				</form> 
								             		</div>
								             	</div>
						        			</div>  
										</td>
										</tr>
									</c:forEach>
								</tbody>
							<%-- </c:if> --%>
						</table>
					</div>
				</article>
		</section>
	</div>
	</div>
		<%@ include file="../include/sidebar.jsp" %>
</div>


<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>		
<script src="/resources/assets/js/main.js"></script>

  <script type="text/javascript"> 
  var modal = document.querySelector(".modal"); 
  var trigger = document.querySelectorAll(".trigger");  
  var closeButton = document.querySelector(".close-button"); 
  var cancelButton = document.querySelector("#cancel");

  trigger.forEach(function(element) {
    element.addEventListener("click", toggleModal);
  });

  function toggleModal() { 
    modal.classList.toggle("show-modal"); 
  }

  function windowOnClick(event) { 
    if (event.target === modal) { 
      toggleModal(); 
    } 
  }

 /*  closeButton.addEventListener("click", toggleModal); */ 
  /* cancelButton.addEventListener("click", toggleModal);  */
  window.addEventListener("click", windowOnClick); 
         
         
         /*  var modal = document.querySelector(".modal"); 
         var closeButton = document.querySelector(".close-button"); 
         var cancelButton = document.querySelector("#cancel"); */
        // var trigger = document.querySelector(".trigger");  
       /*   console.log(trigger);
         for( var i = 0; i < trigger.length; i++ ){
        	 trigger[i].addEventListener("click", toggleModal); 
			}
        //console.log(modal);

        function toggleModal() { 
             modal.classList.toggle("show-modal"); 
         }

        function windowOnClick(event) { 
             if (event.target === modal) { 
                 toggleModal(); 
             } 
         }*/

        trigger.addEventListener("click", toggleModal); 
  closeButton.addEventListener("click", toggleModal);  
         cancel.addEventListener("click", toggleModal); 
         window.addEventListener("click", windowOnClick);  
         

     </script>



	</body>
</html>