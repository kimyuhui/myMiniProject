<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>까까나라</title>
</head>
<style>
* {
	box-sizing: border-box;
}

html {
	margin: 0;
	scroll-behavior: smooth;
	scroll-snap-type: y mandatory;
}

body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

.section {
	width: 100%;
	height: 100vh;
	min-height: 400px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	scroll-snap-align: start;
	scroll-snap-stop: always;
}

.section h1 {
	margin: 0 0 16px;
	font-size: clamp(40px, 7vw, 80px);
}

.section p {
	font-size: 20px;
}

.section-one {
	background-image: url("./images/snackworldimg2.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	position: relative;
	overflow: hidden;
}
    
.cloud {
	position: absolute;
    width: 150px;
    height: auto;
    top: 10%;
    right: 10%;
    animation: floatCloud 4s ease-in-out infinite; 
}

@keyframes floatCloud {
    0%, 100% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-30px);
    }
}

.cookie1,
.cookie2 {
    position: absolute;
    bottom: 0;
    width: 240px;
    height: auto;
    z-index: 2;
    object-fit: contain;
}

.cookie1 {
    left: 37%;
}

.cookie2 {
    right: 35%;
    margin-bottom: 20px;
}

.welcome {
    position: absolute;
    width: 15%;
    left: 30%;
    bottom: 25%;
    z-index: 3;
}

.intro-text {
    text-align: center;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    color:white;
}

.intro-text h1,
.intro-text p {
    opacity: 0;
    animation: textLoop 6s infinite;
}

.intro-text h1 {
    animation-delay: 0s;
}

.intro-text p {
    animation-delay: 1.5s;
}

@keyframes textLoop {
    0%, 100% {
        opacity: 0;
        transform: translateY(15px);
    }

    15%, 65% {
        opacity: 1;
        transform: translateY(0);
    }

    80% {
        opacity: 0;
        transform: translateY(-10px);
    }
}

    .section-two {
        background: #e8d5bd;
        color: #5c4033;
    }

.brand-intro {
    font-family: 'OngleipParkDahyeon', sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.brand-intro h1 {
    font-size: 80px;
}

.brand-intro p {
	font-size: 40px;
	color: #9c8472;
}

.snack-list {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin-top: 40px;
}

.snack1,
.snack2,
.snack3 {
    width: 400px;
    height: 450px;
    background-color: white;
    border-radius: 15px;
    transition: transform 0.3s ease;
}

.snack1:hover,
.snack2:hover,
.snack3:hover {
    transform: translateY(-6px);
}

.snack1 {
	background-image: url("./images/snack4.jpeg");
 	background-size: cover;
  	background-position: center;
  	background-repeat: no-repeat;
}

.snack2 {
	background-image: url("./images/snack5.jpeg");
 	background-size: cover;
  	background-position: center;
  	background-repeat: no-repeat;
}

.snack3 {
	background-image: url("./images/snack6.jpeg");
 	background-size: cover;
  	background-position: center;
  	background-repeat: no-repeat;
}

    .section-three {
    background-image: url("./images/peanutpeople.png");
 	background-size: cover;
  	background-position: center;
  	background-repeat: no-repeat;
    }

.site-footer {
	min-height: 140px;
	padding: 35px 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #fffaf2;
	color: #5c4033;
	scroll-snap-align: start;
	scroll-snap-stop: normal;
}


.fade-text {
    opacity: 0;
    transform: translateY(15px);
}

.fade-text.show {
    animation: fadeIn 1s ease forwards;
}

.fade-text.show:nth-child(1) {
    animation-delay: 0s;
}

.fade-text.show:nth-child(2) {
    animation-delay: 1s;
}

.fade-text.show:nth-child(3) {
    animation-delay: 2s;
}

.fade-text.show:nth-child(4) {
    animation-delay: 3s;
}

@keyframes fadeIn {
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.health-intro {
	transform: translateY(-50px);
}

.health-intro .text1 {
    font-family: 'JeonnamEducationTtobaks', sans-serif;
    font-size: 70px;
    font-weight: normal;
}

.health-intro .text2,
.health-intro .text3,
.health-intro .text4 {
	font-family: 'JeonnamEducationBarun', sans-serif;
	font-size: 28px;
	font-weight: 300;
}

</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<main>
    <section class="section section-one" id="home">
    <img src="./images/bear.png" class="cloud" alt="곰" style = "width: 15%;">
    <img src="./images/cookie1.png" class="cookie1" alt="쿠키">
    <img src="./images/cookie2.png" class="cookie2" alt="쿠키">
    <img src="./images/welcome2.png" class="welcome" alt="말풍선">
    </section>

<section class="section section-two" id="brands">

    <div class="brand-intro">
        <h1>달콤한 세상으로의 초대</h1>
        <p>까까나라에서만 제공되는 특별한 간식을 만나보세요</p>
    </div>

    <div class="snack-list">
	    <a href = "./snack.jsp?id=<%="SNACK005" %>">
      	  <div class="snack1"></div>
 	   </a>
 	   <a href = "./snack.jsp?id=<%="SNACK012" %>">
    <div class="snack2"></div>
       </a>
       <a href = "./snack.jsp?id=<%="SNACK008" %>">
    <div class="snack3"></div>
    </a>
    </div>

</section>
	
<section class="section section-three" id="peanut">
   <div class="health-intro">
    <p class="fade-text text1">맛있는 순간에도, 건강한 마음을 담아</p>

    <p class="fade-text text2">
        까까나라는 원재료부터 꼼꼼하게 살펴 더 나은 간식 경험을 추구합니다.
    </p>

    <p class="fade-text text3">
        품질과 안전을 중요하게 생각하며, 믿을 수 있는 먹거리를 소개하기 위해 노력합니다.
    </p>

    <p class="fade-text text4">
        소소한 간식 시간까지 기분 좋고 안심할 수 있도록, 까까나라가 함께하겠습니다.
    </p>
    
</div>
</section>

</main>

<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const section3 = document.querySelector("#peanut");
    const texts = section3.querySelectorAll(".fade-text");

    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
            if (entry.isIntersecting) {
                texts.forEach((text) => {
                    text.classList.add("show");
                });

                observer.unobserve(section3);
            }
        });
    }, {
        threshold: 0.3
    });

    observer.observe(section3);
</script>
</html>