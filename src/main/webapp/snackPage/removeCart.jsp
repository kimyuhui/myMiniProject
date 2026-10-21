<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.Snack"%>
<%@page import="com.dao.SnackRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("snackList.jsp");
		return;
	}
	
	SnackRepository snackDAO = new SnackRepository();
	
	Snack snack = snackDAO.getSnackInfo(id);
	
	ArrayList<Snack> cartList = (ArrayList<Snack>) session.getAttribute("cartlist");
	Snack goodsQnt = new Snack();
	
	for(int i = 0; i < cartList.size(); i++) {
		goodsQnt = cartList.get(i);
		if(goodsQnt.getSnackId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
</body>
</html>