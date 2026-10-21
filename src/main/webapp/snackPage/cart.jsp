<%@page import="com.dto.Snack"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 | 과자나라</title>
<link rel="stylesheet" href="./css.css">

<style>
body {
    margin: 0;
    background: #fffdf9;
    color: #5c4033;
    font-family: 'Suit', sans-serif;
}

.cart-page {
    max-width: 1100px;
    margin: 0 auto;
    padding: 125px 40px 90px;
    min-height: 70vh;
}

.cart-title {
    text-align: center;
    font-size: 32px;
    font-weight: 600;
    margin-bottom: 40px;
}

.cart-container {
    background: white;
    border-top: 2px solid #8b6b52;
    border-bottom: 1px solid #eadfd5;
}

.cart-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    padding: 24px 20px;
    border-bottom: 1px solid #eee5de;
}

.cart-item:last-child {
    border-bottom: none;
}

.cart-product {
    display: flex;
    align-items: center;
    gap: 24px;
    flex: 1;
    min-width: 0;
}

.cart-image {
    width: 115px;
    height: 115px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #fffaf5;
    border-radius: 12px;
}

.cart-image img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}

.cart-info {
    min-width: 0;
}

.cart-name {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 12px;
    overflow-wrap: anywhere;
}

.cart-price {
    color: #a7653f;
    font-size: 16px;
    font-weight: 600;
}

.cart-unit {
    margin-top: 5px;
    font-size: 13px;
    color: #9c8472;
}

.cart-actions {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 18px;
    flex-shrink: 0;
}

.quantity-form {
    display: flex;
    align-items: center;
    gap: 12px;
}

.quantity-btn {
    width: 30px;
    height: 30px;
    border: 1px solid #e4d5c9;
    background: white;
    color: #5c4033;
    border-radius: 6px;
    cursor: pointer;
    font-size: 18px;
}

.quantity-btn:hover {
    background: #fff4e9;
}

.quantity-number {
    min-width: 20px;
    text-align: center;
    font-size: 15px;
}

.remove-btn {
    border: 1px solid #d8b7a5;
    background: white;
    color: #a7653f;
    padding: 8px 13px;
    border-radius: 7px;
    font-size: 13px;
    text-decoration: none;
    white-space: nowrap;
}

.remove-btn:hover {
    background: #fff4ed;
}

.cart-empty {
    padding: 65px 20px;
    text-align: center;
    font-family: OngleipParkDahyeon, sans-serif;
    font-size: 40px;
}

.cart-summary {
    margin-top: 30px;
    padding: 26px 24px;
    background: #f9f2eb;
    border-radius: 12px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
}

.summary-label {
    font-size: 16px;
}

.summary-price {
    font-size: 26px;
    font-weight: 700;
    color: #a7653f;
}

.cart-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    margin-top: 24px;
}

.continue-btn {
    padding: 13px 20px;
    border: 1px solid #d8c5b5;
    color: #80634e;
    text-decoration: none;
    border-radius: 8px;
    background: white;
}

.order-btn {
    padding: 14px 30px;
    background: #8b6b52;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    border: none;
    font-size: 15px;
    cursor: pointer;
}

.order-btn:hover {
    background: #72533d;
}

</style>
</head>

<body>


<jsp:include page="header.jsp" />

  <%
    String cartId = session.getId();

    ArrayList<Snack> cartList =
        (ArrayList<Snack>) session.getAttribute("cartlist");

    int sum = 0;

    if (cartList != null) {
        for (Snack snack : cartList) {
            sum += snack.getSnackPrice() * snack.getQuantity();
        }
    }
    %>


<main class="cart-page">

    <h1 class="cart-title">장바구니</h1>
    <div class="cart-container">

    <% if (cartList == null || cartList.isEmpty()) { %>

        <div class="cart-empty">
        	<img src = "./images/empty.png" style = "width: 20%; margin-bottom: 20px;">
            <p>장바구니가 비어 있어요.</p>
        </div>

    <% } else {
        for (Snack snack : cartList) {
    %>

        <div class="cart-item">

            <div class="cart-product">

                <div class="cart-image">
                    <img
                        src="./images/<%= snack.getSnackId() %>.png"
                        alt="<%= snack.getSnackName() %>">
                </div>

                <div class="cart-info">
                    <div class="cart-name">
                        <%= snack.getSnackName() %>
                    </div>

                    <div class="cart-price">
                        <%= String.format("%,d", snack.getSnackPrice()) %>원
                    </div>

                    <div class="cart-unit">
                        개당 가격
                    </div>
                </div>

            </div>

            <div class="cart-actions">

                <form class="quantity-form" method="post"
    				action="./updateCart.jsp">

                    <input type="hidden" name="id"
                           value="<%= snack.getSnackId() %>">

                    <button type="submit" name="change" value="minus"
                            class="quantity-btn"
                            aria-label="수량 줄이기">−</button>

                    <span class="quantity-number">
                        <%= snack.getQuantity() %>
                    </span>

                    <button type="submit" name="change" value="plus"
                            class="quantity-btn"
                            aria-label="수량 늘리기">+</button>

                </form>

                <a class="remove-btn"
                   href="./removeCart.jsp?id=<%= snack.getSnackId() %>"
                   onclick="return confirm('이 상품을 삭제할까요?');">
                    삭제
                </a>

            </div>

        </div>

    <%  }
       }
    %>

    </div>

    <% if (cartList != null && !cartList.isEmpty()) { %>

    <div class="cart-summary">
        <div class="summary-row">
            <span class="summary-label">총 상품 금액</span>
            <span class="summary-price">
                <%= String.format("%,d", sum) %>원
            </span>
        </div>
    </div>

    <div class="cart-bottom">
        <a href="./snackList.jsp" class="continue-btn">
            ← 쇼핑 계속하기
        </a>

        <a href="./orderConfirm.jsp?cartId=<%= cartId %>"
           class="order-btn"
           onclick="return confirm('주문하시겠습니까?');">
            주문하기
        </a>
    </div>

    <% } %>

</main>

<jsp:include page="footer.jsp" />

</body>
</html>
