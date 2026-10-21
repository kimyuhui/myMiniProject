<%@page import="com.dao.SellListRepository"%>
<%@page import="com.dto.Snack"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과 | 과자나라</title>
<link rel="stylesheet" href="./css.css">

<style>
.order-result-page {
    min-height: 65vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 125px 20px 80px;
    background: #fffdf9;
    box-sizing: border-box;
}

.result-card {
    width: 100%;
    max-width: 540px;
    padding: 48px 35px;
    box-sizing: border-box;
    text-align: center;
    background: white;
    border: 1px solid #eee3d8;
    border-radius: 18px;
    box-shadow: 0 8px 30px rgba(92, 64, 51, 0.07);
}

.result-icon {
    width: 120px;
    height: 120px;
    margin: 0 auto 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: #f8eee3;
    overflow: hidden;
}

.result-icon img {
    width: 70%;
    object-fit: contain;
}

.result-title {
    margin: 0 0 15px;
    color: #5c4033;
    font-size: 28px;
    font-weight: 700;
}

.result-message {
    margin: 0;
    color: #8c796b;
    font-size: 15px;
    line-height: 1.8;
    word-break: keep-all;
}

.result-divider {
    height: 1px;
    margin: 30px 0;
    background: #eee5dc;
}

.result-btn {
    display: inline-block;
    padding: 14px 28px;
    border-radius: 8px;
    background: #8b6b52;
    color: white;
    font-size: 15px;
    text-decoration: none;
    transition: background 0.2s;
}

.result-btn:hover {
    background: #72533d;
    color: white;
}

.result-subtext {
    margin-top: 18px;
    color: #b0a094;
    font-size: 12px;
}

</style>
</head>

<body>
<jsp:include page="header.jsp"/>

<%
    ArrayList<Snack> cartList =
    (ArrayList<Snack>) session.getAttribute("cartlist");

    String resultTitle = "";
    String resultMessage = "";
    String resultImage = "";
    boolean success = false;

    if (cartList == null || cartList.isEmpty()) {

        resultTitle = "장바구니가 비어 있어요";
        resultMessage = "주문할 과자를 먼저 장바구니에 담아 주세요.";
        resultImage = "./images/fail.png";

    } else {

        SellListRepository sellListDAO = new SellListRepository();
        boolean enough = true;

        for (int i = 0; i < cartList.size(); i++) {
            Snack snack = cartList.get(i);
            int inventory = sellListDAO.getInventory(snack.getSnackId());

            if (inventory < snack.getQuantity() || inventory == -1) {
                enough = false;
                break;
            }
        }

        if (enough) {
            boolean orderSuccess = true;

            for (int i = 0; i < cartList.size(); i++) {
                Snack snack = cartList.get(i);

                int result = sellListDAO.updateInventory(
                    snack.getSnackId(), snack.getQuantity());

                if (result != 1) {
                    orderSuccess = false;
                    break;
                }
            }

            if (orderSuccess) {
                session.removeAttribute("cartlist");

                success = true;
                resultTitle = "주문이 완료되었습니다!";
                resultMessage = "까까나라를 이용해 주셔서 감사합니다.<br>즐거운 간식 시간 되세요!";
                resultImage = "./images/success.png";
            } else {
                resultTitle = "주문에 실패했습니다";
                resultMessage = "주문을 처리하지 못했습니다.<br>재고를 확인한 뒤 다시 시도해 주세요.";
                resultImage = "./images/fail.png";
            }
        } else {
            resultTitle = "재고가 부족해요";
            resultMessage = "장바구니에 담긴 상품 중 재고가 부족한 상품이 있습니다.<br>장바구니에서 수량을 확인해 주세요.";
            resultImage = "./images/empty.png";
        }
    }
%>

<main class="order-result-page">
    <section class="result-card">
        <div class="result-icon">
    		<img src="<%= resultImage %>" alt="주문 결과 이미지">
		</div>
        <h1 class="result-title"><%= resultTitle %></h1>
        <p class="result-message">
            <%= resultMessage %>
        </p>
        <div class="result-divider"></div>
        <% if (success) { %>
            <a href="./snackList.jsp" class="result-btn">
                과자 더 구경하기
            </a>
            <p class="result-subtext">
                달콤한 간식과 함께 행복한 하루 보내세요.
            </p>
        <% } else { %>
            <a href="./cart.jsp" class="result-btn">
                장바구니 확인하기
            </a>
            <p class="result-subtext">
                상품 목록에서 다른 과자도 구경할 수 있어요.
            </p>
        <% } %>
    </section>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>