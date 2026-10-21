<%@ page import="com.dto.Snack"%>
<%@ page import="com.dao.SnackRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>과자 상세보기 - 까까나라</title>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: #fffdf9;
	color: #333;
	font-family: Arial, sans-serif;
}

main {
	max-width: 1200px;
	width: 90%;
	margin: 60px auto 100px;
}

.product-detail {
	display: flex;
	gap: 55px;
	align-items: flex-start;
	padding: 40px;
	background-color: white;
	border: 1px solid #eee8df;
	border-radius: 16px;
	box-shadow: 0 5px 20px rgba(80, 50, 20, 0.06);
}

.product-image {
	flex: 1;
	min-width: 0;
	height: 400px;
	padding: 0;
	overflow: hidden;
	background-color: #fffaf2;
	border-radius: 12px;
}

.product-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

.product-info {
	flex: 1;
	min-width: 0;
	padding: 10px 0;
}

.product-info h1 {
	font-size: 32px;
	line-height: 1.4;
	margin: 0 0 15px;
	color: #30271f;
	overflow-wrap: anywhere;
}

.product-subtitle {
	color: #888;
	font-size: 15px;
	margin-bottom: 20px;
}

.rating {
	font-size: 17px;
	margin-bottom: 25px;
}

.stars {
	color: #f3ae38;
	letter-spacing: 2px;
}

.price-area {
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	padding: 22px 0;
	margin-bottom: 25px;
}

.price-label {
	color: #888;
	font-size: 14px;
	margin-bottom: 8px;
}

.product-price {
	color: #c66a2b;
	font-size: 30px;
	font-weight: bold;
}

.price-unit {
	font-size: 17px;
}

.info-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 28px;
	font-size: 14px;
	table-layout: fixed;
}

.info-table th, .info-table td {
	padding: 14px 10px;
	border-bottom: 1px solid #eee;
	text-align: left;
	vertical-align: top;
	overflow-wrap: anywhere;
	line-height: 1.6;
}

.info-table th {
	width: 105px;
	color: #777;
	font-weight: normal;
	background-color: #fffdfa;
}

.info-table td {
	color: #333;
}

.button-area {
	display: flex;
	gap: 10px;
	margin-top: 25px;
}

.button-area a {
	flex: 1;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	min-height: 52px;
	padding: 12px;
	border-radius: 8px;
	text-decoration: none;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	transition: 0.2s;
	cursor: pointer;
}

.btn-cart {
	background-color: white;
	color: #a56b36;
	border: 1px solid #d8b58e;
}

.btn-buy {
	background-color: #b87942;
	color: white;
	border: 1px solid #b87942;
}

.btn-list {
	display: inline-block;
	margin-top: 22px;
	color: #777;
	text-decoration: none;
	font-size: 14px;
}

.button-area a:hover {
	opacity: 0.8;
	transform: translateY(-2px);
}

.btn-list:hover {
	color: #b87942;
}

.quantity-area {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 20px 0;
	padding: 18px 0;
	border-bottom: 1px solid #eee;
	font-size: 15px;
}

.quantity-control {
	display: flex;
	align-items: center;
	border: 1px solid #ddd;
	border-radius: 6px;
	overflow: hidden;
}

.quantity-control button {
	width: 40px;
	height: 40px;
	border: none;
	background-color: #fffaf2;
	font-size: 22px;
	cursor: pointer;
}

.quantity-control button:hover {
	background-color: #f3e5d3;
}

.quantity-control input {
	width: 65px;
	height: 40px;
	border: none;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	text-align: center;
	font-size: 16px;
	outline: none;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
    SnackRepository snackDAO = new SnackRepository();
    String snackId = request.getParameter("id");
    Snack snack = snackDAO.getSnackInfo(snackId);
    int i = Integer.parseInt(snackId.substring(snackId.length() - 3));
%>
	<main>
		<% if (snack != null) { %>
		<div class="product-detail">
			<div class="product-image">
				<img src="./images/<%= snack.getSnackId() %>.jpeg"
					alt="<%= snack.getSnackName() %>"
					onmouseover="this.src='./images/<%= snack.getSnackId() %><%=i %>.jpeg'"
					onmouseout="this.src='./images/<%= snack.getSnackId() %>.jpeg'">
			</div>
			<div class="product-info">
				<h1><%= snack.getSnackName() %></h1>
				<p class="product-subtitle">
					<%= snack.getSnackCompany() %>
				</p>
				<div class="price-area">
					<div class="price-label">판매 가격</div>
					<div class="product-price">
						<%= String.format("%,d", snack.getSnackPrice()) %>
						<span class="price-unit">원</span>
					</div>
				</div>
				<table class="info-table">
					<tr>
						<th>상품명</th>
						<td><%= snack.getSnackName() %></td>
					</tr>
					<tr>
						<th>제조사</th>
						<td><%= snack.getSnackCompany() %></td>
					</tr>
					<tr>
						<th>열량</th>
						<td><%= snack.getSnackKcal() %></td>
					</tr>
					<tr>
						<th>원재료</th>
						<td><%= snack.getSnackIngredients() %></td>
					</tr>
				</table>
				<form name="addForm"
					action="./addCart.jsp?id=<%= snack.getSnackId() %>" method="post">
					<div class="quantity-area">
						<span>상품 수량</span>
						<div class="quantity-control">
							<button type="button" onclick="changeQuantity(-1)">−</button>
							<input type="number" id="quantity" name="quantity" value="1"
								min="1" max="99" required>
							<button type="button" onclick="changeQuantity(1)">+</button>
						</div>
					</div>
					<div class="button-area">
						<a href="#" class="btn-cart" onclick="addToCart(); return false;">장바구니
							담기</a>
					</div>
				</form>
				<a href="./snackList.jsp" class="btn-list"> ← 상품 목록으로 돌아가기 </a>
			</div>
		</div>
		<% } else { %>
		<h2>상품을 찾을 수 없습니다.</h2>
		<a href="./snackList.jsp">상품 목록으로 돌아가기</a>
		<% } %>

	</main>
	<jsp:include page="footer.jsp" />

	<script>
    function changeQuantity(amount) {
        const input = document.getElementById("quantity");

        let quantity = parseInt(input.value) || 1;
        quantity += amount;

        if (quantity < 1) {
            quantity = 1;
        }

        if (quantity > 99) {
            quantity = 99;
        }

        input.value = quantity;
    }

    function addToCart() {
        const form = document.forms["addForm"];
        const input = document.getElementById("quantity");

        if (input.value === "" ||
            !Number.isInteger(Number(input.value)) ||
            Number(input.value) < 1 ||
            Number(input.value) > 99) {
            alert("수량은 1개부터 99개까지 입력해 주세요.");
            input.focus();
            return;
        }

        if (confirm("선택한 수량만큼 장바구니에 추가하시겠습니까?")) {
            form.submit();
        }
    }
</script>

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