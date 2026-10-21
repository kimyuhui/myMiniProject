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
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	
	if (id == null || id.trim().equals("")) {
	    response.sendRedirect("snackList.jsp");
	    return;
	}

	SnackRepository snackDAO = new SnackRepository();

	ArrayList<Snack> goodsList = snackDAO.getSnackList();
	Snack goods = null;

	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);

		if (goods.getSnackId().equals(id)) {
			break;
			}
		}

	ArrayList<Snack> list = (ArrayList<Snack>) session.getAttribute("cartlist");
	if (list == null) {
		list = new ArrayList<Snack>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Snack goodsQnt = new Snack();

	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getSnackId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + quantity;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) {
		goods.setQuantity(quantity);
		list.add(goods);
	}

	session.setAttribute("toastMessage", "장바구니에 담겼습니다!");
	String referer = request.getHeader("Referer");

	if (referer != null && !referer.isEmpty()) {
	    response.sendRedirect(referer);
	} else {
	    response.sendRedirect("snackList.jsp");
	}


	%>

</body>
</html>