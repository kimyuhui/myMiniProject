<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.*, com.dto.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과자목록 | 과자나라</title>
<link rel="stylesheet" href="./css.css">
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: #fffdf9;
	color: #5c4033;
	font-family: 'Suit', sans-serif;
}

.snack-page {
	padding: 125px 40px 80px;
	max-width: 1400px;
	margin: 0 auto;
	min-height: 80vh;
}

.page-title {
	font-size: 32px;
	font-weight: 600;
	text-align: center;
	margin-bottom: 12px;
}

.page-subtitle {
	text-align: center;
	color: #9c8472;
	margin-bottom: 45px;
}

.snack-grid {
	display: grid;
	grid-template-columns: repeat(3, minmax(0, 1fr));
	gap: 30px;
}

.snack-card {
	position: relative;
	min-width: 0;
	padding: 28px 24px;
	background: transparent;
	border: none;
	border-radius: 0;
	box-shadow: none;
	transition: transform 0.25s;
}

.snack-card:hover {
	transform: translateY(-3px);
	box-shadow: none;
}

.snack-image {
	text-align: center;
	margin-bottom: 20px;
}

.snack-image img {
	width: 100%;
	max-width: 250px;
	height: 220px;
	object-fit: contain;
	display: block;
	margin: 0 auto;
}

.snack-name {
	min-height: 52px;
	margin: 0 0 16px;
	padding-bottom: 14px;
	border-bottom: 1px solid #f0e5dc;
	font-size: 21px;
	font-weight: 600;
	overflow-wrap: anywhere;
	text-align: center;
}

.snack-price {
	margin-bottom: 18px;
	font-size: 23px;
	font-weight: 700;
	color: #a7653f;
}

.snack-description {
	min-height: 75px;
	padding: 14px 0;
	color: #806d60;
	font-size: 14px;
	line-height: 1.8;
	overflow-wrap: anywhere;
}

.snack-detail {
	display: inline-block;
	margin-top: 18px;
	color: #8b6b52;
	font-size: 14px;
	text-decoration: none;
}

.snack-detail:hover {
	text-decoration: underline;
}

.cart-form {
	position: absolute;
	right: 18px;
	bottom: 18px;
	margin: 0;
}

.cart-button {
	width: 36px;
	height: 36px;
	padding: 0;
	border: none;
	border-radius: 0;
	background: transparent;
	cursor: pointer;
	opacity: 0;
	visibility: hidden;
	transform: translateY(10px) scale(0.8);
	transition: opacity 0.25s ease, transform 0.25s ease, visibility 0.25s;
}

.snack-card:hover .cart-button, .cart-button:focus-visible {
	opacity: 1;
	visibility: visible;
	transform: translateY(0) scale(1);
}

.cart-button img {
	display: block;
	width: 28px;
	height: 28px;
	object-fit: contain;
}

.cart-button:hover img {
	transform: scale(1.12);
}

.cart-button img {
	transition: transform 0.2s ease;
}

.empty-message {
	grid-column: 1/-1;
	padding: 60px 0;
	text-align: center;
	color: #9c8472;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="snack-page">
		<h1 class="page-title">과자 목록</h1>
		<p class="page-subtitle">오늘은 어떤 과자가 먹고 싶으신가요?</p>
		<div class="snack-grid">
			<%
        		SnackRepository snackDAO = new SnackRepository();
        		ArrayList<Snack> snackList = snackDAO.getSnackList();

        		if (snackList == null || snackList.isEmpty()) {
    		%>
			<p class="empty-message">등록된 과자가 없습니다.</p>
			<%
        		} else {
        	
        			int i = 1;
            		for (Snack snack : snackList) {
    		%>
			<article class="snack-card">
				<div class="snack-image">
					<img src="./images/<%= snack.getSnackId() %>.png"
						onmouseover="this.src='./images/<%= snack.getSnackId() %><%=i %>.png'"
						onmouseout="this.src='./images/<%= snack.getSnackId() %>.png'"
						alt="<%= snack.getSnackName() %>">
				</div>
				<h2 class="snack-name">
					<%= snack.getSnackName() %>
				</h2>
				<div class="snack-price">
					<%= String.format("%,d", snack.getSnackPrice()) %>원
				</div>
				<div class="snack-description">
					<%= snack.getSnackDescription() %>
				</div>
				<a class="snack-detail"
					href="./snack.jsp?id=<%= snack.getSnackId() %>"> 상세정보 보기 → </a>
				<form class="cart-form" action="./addCart.jsp" method="post">
					<input type="hidden" name="id" value="<%= snack.getSnackId() %>">
					<input type="hidden" name="quantity" value="1">
					<button type="submit" class="cart-button"
						aria-label="<%= snack.getSnackName() %> 장바구니에 담기" title="장바구니에 담기">
						<img src="./images/shoppingcart.png" alt="장바구니">
					</button>
				</form>
			</article>
			<%
			i++;
            }
        }
    %>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
String toastMessage =
    (String) session.getAttribute("toastMessage");

if (toastMessage != null) {
    session.removeAttribute("toastMessage");
%>

	<div id="cartToast" class="cart-toast">
		<%= toastMessage %>
	</div>

	<script>
window.addEventListener("DOMContentLoaded", function () {
    const toast = document.getElementById("cartToast");

    if (toast) {
        toast.classList.add("show");

        setTimeout(function () {
            toast.classList.remove("show");
        }, 2500);
    }
});
</script>

<style>
.cart-toast {
	position: fixed;
	bottom: 30px;
	left: 50%;
	transform: translate(-50%, 20px);
	background: #49382d;
	color: white;
	padding: 14px 24px;
	border-radius: 10px;
	opacity: 0;
	transition: opacity 0.3s, transform 0.3s;
	z-index: 9999;
	pointer-events: none;
}

.cart-toast.show {
	opacity: 1;
	transform: translate(-50%, 0);
}
</style>

	<%
}
%>
</body>
</html>
