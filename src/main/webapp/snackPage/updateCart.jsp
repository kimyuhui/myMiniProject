<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dto.*, com.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String change = request.getParameter("change");
	
	  ArrayList<Snack> cartList =
		        (ArrayList<Snack>) session.getAttribute("cartlist");

		    if (cartList != null && id != null && change != null) {
		        for (Snack snack : cartList) {
		            if (snack.getSnackId().equals(id)) {

		                int quantity = snack.getQuantity();

		                if ("plus".equals(change)) {
		                    snack.setQuantity(quantity + 1);
		                } else if ("minus".equals(change) && quantity > 1) {
		                    snack.setQuantity(quantity - 1);
		                }

		                break;
		            }
		        }
		    }
		    response.sendRedirect("cart.jsp");
%>
</body>
</html>