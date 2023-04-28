<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Banner -->
								<section id="banner">
									<div class="content">
									<div class="wrap">
									  <div class="shippingStatusContainer">
									    <div class="status">
									      
									      <div class="item">
									        <div>
									        <img alt="프로필사진" src="/resources/img/soul.jpg" width="150px" height="100px" >
									       </div>
									      	
									        <div>
									          <div class="text">${sessionScope.id }</div>
									       	   <div class="text">페이 : 50,000원</div>
									         <a href="#"><div class="memberUpdate">회원정보수정</div></a>
									        </div>
									      </div>
									      <div class="item">
									        <div>
									        <a href="/trade/buyList" > <div class="text">거래내역</div>
									          <div class="rightBlue number">6</div></a>
									        </div>
									      </div>  
									      <div class="item">
									        <div>
									         <a href="/trade/mySaleProduct" > <div class="text">판매상품</div>
									          <div class="rightBlue number">6</div></a>
									        </div>
									      </div>    
									      <div class="item">
									        <div>
									          <a href="/trade/myAuctionList" > <div class="text">경매내역</div>
									          <div class="rightBlue number">6</div></a>
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									        <a href="/trade/favorite" > <div class="text">찜한상품</div>
									          <div class="rightBlue number">6</div></a>
									        </div>
									      </div>     
									      <div class="item">
									     <a href="/trade/buyReview">  <div>
									          <div class="text">거래후기</div>
									          <div class="rightBlue number">3</div></a>
									        </div>
									      </div>      
									      
									    </div>
								
													    
									  </div>  
									</div>	
								
									 <div class="infoContainer">
									    <a href="/trade/mySaleProduct" class="item">
									      <div>판매중</div>
									    </a>    
									   
									    <a href="#" class="item">
									      <div>판매완료</div>
									    </a>    
									  </div>	
									  </section>
									  
				  <a href="/trade/mySaleProduct?product" class="button" style="display: inline-block; float: right;">거래</a>
				  <a href="/trade/mySaleAuction" class="button" style="display: inline-block; float: right;">경매</a>
				<a href="/trade/mySaleProduct?" class="button" style="display: inline-block; float: right;">응모</a>
