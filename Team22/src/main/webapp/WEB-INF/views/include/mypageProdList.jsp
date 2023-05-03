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
									      	
									       <div style="margin-left: 10px;">
									          <div style="font-size: 20px;" >${sessionScope.id }</div>
									       	   <div style="font-size: 20px;">페이 : 50,000원</div>
									         <a href="/members/updatePwCk"><div style="font-size: 20px;">회원정보수정</div></a>
									         <a href="/members/deletePwCk"><div style="font-size: 20px;">회원탈퇴</div></a>
									        </div>
									      </div>
									      <div class="item">
									        <div>
									        <a href="/trade/buyList" > <div class="text">거래내역</div>
									          </a>
									        </div>
									      </div>  
									      <div class="item">
									        <div>
									         <a href="/trade/mySaleProduct" > <div class="text">판매상품</div>
									          </a>
									        </div>
									      </div>    
									      <div class="item">
									        <div>
									          <a href="/trade/myAuctionList" > <div class="text">경매내역</div>
									          </a>
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									        <a href="/trade/favorite" > <div class="text">찜한상품</div>
									          </a>
									        </div>
									      </div>     
									      <div class="item">
									     <a href="/trade/buyReview">  <div>
									          <div class="text">거래후기</div>
									          </a>
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
									  
				  <a href="/trade/mySaleProduct?product" class="button" style="display: inline-block; float: right;">일반</a>
				  <a href="/trade/mySaleAuction" class="button" style="display: inline-block; float: right;">경매</a>
				<a href="/trade/mySaleRandom" class="button" style="display: inline-block; float: right;">응모</a>
