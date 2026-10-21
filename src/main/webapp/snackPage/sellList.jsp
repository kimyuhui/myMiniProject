<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매목록 관리 | 과자나라</title>
<link rel="stylesheet" href="./css.css">
<style>
.admin-page {
    max-width: 1200px;
    margin: 0 auto;
    padding: 125px 30px 80px;
    min-height: 70vh;
    color: #49382d;
}

.admin-heading {
    display: flex;
    justify-content: space-between;
    align-items: end;
    gap: 20px;
    margin-bottom: 30px;
}

.admin-heading h2 {
    margin: 0 0 8px;
    font-size: 30px;
    font-weight: 700;
}

.admin-heading p {
    margin: 0;
    color: #968477;
    font-size: 14px;
}

.admin-label {
    display: inline-block;
    padding: 7px 12px;
    border-radius: 20px;
    background: #f5e9dc;
    color: #916746;
    font-size: 13px;
}

.admin-panel {
    padding: 25px;
    background: white;
    border: 1px solid #eee5dc;
    border-radius: 14px;
    box-shadow: 0 5px 20px rgba(80, 55, 35, 0.04);
}

.admin-toolbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    margin-bottom: 22px;
}

.admin-toolbar h3 {
    margin: 0;
    font-size: 18px;
}

.search-input {
    width: 260px;
    max-width: 100%;
    padding: 11px 14px;
    border: 1px solid #e5d8cc;
    border-radius: 8px;
    outline: none;
    font-size: 14px;
}

.search-input:focus {
    border-color: #a78262;
}

.table-wrap {
    overflow-x: auto;
}

.admin-table {
    width: 100%;
    border-collapse: collapse;
    white-space: nowrap;
}

.admin-table th {
    padding: 15px 13px;
    background: #faf6f1;
    color: #806b5b;
    text-align: left;
    font-size: 13px;
    font-weight: 600;
    border-top: 1px solid #eee5dc;
    border-bottom: 1px solid #e9ded4;
}

.admin-table td {
    padding: 17px 13px;
    border-bottom: 1px solid #f0e9e3;
    font-size: 14px;
}

.admin-table tbody tr:hover {
    background: #fffcf8;
}

.product-id {
    color: #998779;
    font-size: 13px;
}

.product-name {
    font-weight: 600;
    color: #49382d;
}

.price {
    font-weight: 600;
}

.stock {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 20px;
    background: #edf5e9;
    color: #537a43;
    font-size: 12px;
}

.stock-low {
    background: #fff0e5;
    color: #b56a35;
}

.edit-btn {
    display: inline-block;
    padding: 8px 14px;
    border: 1px solid #d9c2ae;
    border-radius: 7px;
    background: white;
    color: #805c40;
    text-decoration: none;
    font-size: 13px;
    transition: 0.2s;
}

.edit-btn:hover {
    background: #8b6b52;
    color: white;
    border-color: #8b6b52;
}

.empty-row {
    padding: 40px !important;
    text-align: center;
    color: #9c8b7d;
}

.edit-input {
    width: 100px;
    padding: 8px;
    border: 1px solid #d9c2ae;
    border-radius: 7px;
    font-size: 14px;
    color: #49382d;
    box-sizing: border-box;
}

.save-button {
    background: #8b6b52;
    color: white;
    cursor: pointer;
}

.cancel-button {
    margin-left: 4px;
    cursor: pointer;
}
</style>
</head>
<body>
<jsp:include page="header.jsp" />
<main class="admin-page">
    <div class="admin-heading">
        <div>
            <h2>판매목록 관리</h2>
        </div>
    </div>
    <section class="admin-panel">
        <div class="admin-toolbar">
            <h3>상품 목록</h3>
            <input type="text" id="searchInput"
                   class="search-input"
                   placeholder="상품명 또는 상품 ID 검색">
        </div>
        <div class="table-wrap">
            <table class="admin-table">
                <thead>
                    <tr>
                        <th>상품 ID</th>
                        <th>상품명</th>
                        <th>제조사</th>
                        <th>판매 가격</th>
                        <th>재고</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody id="productTable">
<%
    String url = "jdbc:mysql://localhost:3306/mini_project";
    String dbUser = "mini";
    String dbPassword = "mini123";
    String sql =
        "SELECT s.snackId, s.snackName, s.snackCompany, " +
        "s.price, sl.inventory " +
        "FROM snackList s " +
        "JOIN sellList sl ON s.snackId = sl.snackId " +
        "ORDER BY s.snackId";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn =
                 DriverManager.getConnection(url, dbUser, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            boolean hasData = false;

            while (rs.next()) {
                hasData = true;

                String id = rs.getString("snackId");
                String name = rs.getString("snackName");
                String company = rs.getString("snackCompany");
                int price = rs.getInt("price");
                int inventory = rs.getInt("inventory");
%>
	<tr class="product-row">
		<td class="product-id"><%= id %></td>
		<td class="product-name"><%= name %></td>
		<td><%= company %></td>
		<td class="price">
    		<span class="display-value">
        		<%= String.format("%,d", price) %>원
    		</span>
    		<input type="number" class="edit-input" name="price" value="<%= price %>" min="1" form="editForm<%= id %>" required hidden>
		</td>
        <td>
    		<span class="stock <%= inventory <= 5 ? "stock-low" : "" %> display-value">
        		<%= inventory %>개
    		</span>
    		<input type="number" class="edit-input" name="inventory" value="<%= inventory %>" min="0" form="editForm<%= id %>" required hidden>
		</td>
    	<td>
			<form id="editForm<%= id %>" action="./updateSell.jsp" method="post">
       			<input type="hidden" name="snackId" value="<%= id %>">
        		<button type="button" class="edit-btn edit-button" onclick="toggleEdit(this)">수정</button>
        		<button type="submit" class="edit-btn save-button" hidden>저장</button>
        		<button type="button" class="edit-btn cancel-button" onclick="cancelEdit(this)" hidden>취소</button>
    		</form>
		</td>
    </tr>
<%
            }
	if (!hasData) {
%>
	<tr>
		<td colspan="6" class="empty-row">등록된 판매 상품이 없습니다.</td>
	</tr>
<%
					}
			}
	} catch (Exception e) {
        application.log("판매목록 조회 오류", e);
%>
		<tr>
        	<td colspan="6" class="empty-row">판매목록을 불러오지 못했습니다. 서버 로그를 확인해 주세요.</td>
        </tr>
<%
    }
%>
</tbody>
</table>
</div>
</section>
</main>

<script>
document.getElementById("searchInput").addEventListener("input", function () {
    const keyword = this.value.toLowerCase();

    document.querySelectorAll(".product-row").forEach(function (row) {
        row.style.display = row.innerText.toLowerCase().includes(keyword)
            ? ""
            : "none";
    });
});

function toggleEdit(button) {
    const row = button.closest("tr");

    row.querySelectorAll(".display-value").forEach(el => {
        el.hidden = true;
    });

    row.querySelectorAll(".edit-input").forEach(el => {
        el.hidden = false;
    });

    row.querySelector(".edit-button").hidden = true;
    row.querySelector(".save-button").hidden = false;
    row.querySelector(".cancel-button").hidden = false;
}

function cancelEdit(button) {
    const row = button.closest("tr");

    row.querySelectorAll(".edit-input").forEach(el => {
        el.value = el.defaultValue;
        el.hidden = true;
    });

    row.querySelectorAll(".display-value").forEach(el => {
        el.hidden = false;
    });

    row.querySelector(".edit-button").hidden = false;
    row.querySelector(".save-button").hidden = true;
    row.querySelector(".cancel-button").hidden = true;
}
</script>

<jsp:include page="footer.jsp" />
</body>
</html>
