<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("snackId");
	String priceText = request.getParameter("price");
	String inventoryText = request.getParameter("inventory");

	if (id == null || id.trim().isEmpty() || priceText == null || inventoryText == null) {
    	response.sendError(400, "상품 정보가 올바르지 않습니다.");
    	return;
	}

	int price;
	int inventory;

	try {
    	price = Integer.parseInt(priceText);
    	inventory = Integer.parseInt(inventoryText);
	} catch (NumberFormatException e) {
    	response.sendError(400, "가격과 재고는 숫자로 입력해 주세요.");
    	return;
	}

	if (price < 1 || inventory < 0) {
    	response.sendError(400, "가격은 1 이상, 재고는 0 이상이어야 합니다.");
    	return;
	}

	String url = "jdbc:mysql://localhost:3306/mini_project";
	String dbUser = "mini";
	String dbPassword = "mini123";

	String priceSql = "UPDATE snackList SET price = ? WHERE snackId = ?";

	String inventorySql = "UPDATE sellList SET inventory = ? WHERE snackId = ?";

	Connection conn = null;

	try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection(url, dbUser, dbPassword);
    	conn.setAutoCommit(false);

    	try {
        	try (PreparedStatement pstmt = conn.prepareStatement(priceSql)) {
            	pstmt.setInt(1, price);
            	pstmt.setString(2, id);
            	int result = pstmt.executeUpdate();
            	if (result == 0) {
                	throw new SQLException(
                    	"상품 ID가 snackList에 존재하지 않습니다: " + id);
            	}
        	}

        try (PreparedStatement pstmt = conn.prepareStatement(inventorySql)) {
			pstmt.setInt(1, inventory);
            pstmt.setString(2, id);
            int result = pstmt.executeUpdate();
            if (result == 0) {
                throw new SQLException(
                    "상품 ID가 sellList에 존재하지 않습니다: " + id);
            }
        }
        conn.commit();
    } catch (Exception e) {
        conn.rollback();
        throw e;
    }
    response.sendRedirect("./sellList.jsp?updated=1");

	} catch (Exception e) {
    	application.log("판매목록 수정 오류", e);
    	response.sendError(500, "판매목록 수정 중 오류가 발생했습니다. 서버 로그를 확인해 주세요.");
	} finally {
    	if (conn != null) {
        	try {
            	conn.close();
        	} catch (SQLException e) {
            	application.log("DB 연결 종료 오류", e);
        	}
    	}
	}
%>
