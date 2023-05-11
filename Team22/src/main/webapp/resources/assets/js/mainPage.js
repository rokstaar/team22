/**
 * 김우현 - 메인 페이지 js
 */




let currentIndex = 0; // 현재 슬라이드 인덱스
let slides, totalSlides, slideWidth;



window.onload = function () {
    var isRecViewHidden = localStorage.getItem('recViewHidden');
    if (isRecViewHidden === 'true') {
        document.querySelector('.rec-view').style.display = 'none';
    }
    
    //setTimeout(function(){
    	updateSlides();
    	var leftBtn = document.getElementById("left-btn");
    	var rightBtn = document.getElementById("right-btn");
    	
    	if(!leftBtn || !rightBtn) return;
    	leftBtn.addEventListener("click", function () {
    	    if (currentIndex > 0) { // 맨 처음 슬라이드가 아니라면
    	        currentIndex--;
    	        document.querySelector(".rec-wrapper").style.transform = 'translateX(' + (-slideWidth * currentIndex) + 'px)';
    	    }
    	});

    	rightBtn.addEventListener("click", function () {
    	    if (currentIndex < totalSlides - 4) { // 맨 마지막 슬라이드가 아니라면
    	        currentIndex++;
    	        document.querySelector(".rec-wrapper").style.transform = 'translateX(' + (-slideWidth * currentIndex) + 'px)';
    	    }
    	});



    	document.querySelector('#close-btn').addEventListener('click', function () {
    	    document.querySelector('.rec-view').style.display = 'none';
    	    localStorage.setItem('recViewHidden', 'true');
    	});
    //}, 3000);
}

function updateSlides() {
    slides = document.getElementsByClassName("rec-product");
    if(slides.length == 0) return;
    
    totalSlides = slides.length; // 슬라이드의 총 개수
    //slideWidth = slides[0].offsetWidth+20; // 각 슬라이드의 너비
    let style = window.getComputedStyle(slides[0]);
    let marginRight = parseFloat(style.marginRight);
    let marginLeft = parseFloat(style.marginLeft);
    
    slideWidth = slides[0].offsetWidth + marginRight + marginLeft; // 각 슬라이드의 너비 + 마진
}