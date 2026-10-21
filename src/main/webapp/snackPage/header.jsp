<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    * {
        box-sizing: border-box;
    }

    .site-header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 80px;
        padding: 0 40px;
        display: flex;
    	justify-content: flex-start;
    	align-items: center;
        background: rgba(255, 255, 255, 0.95);
        z-index: 1000;
    }

    .site-header .logo {
        display: flex;
        margin-left: 400px;
        margin-right: 100px;
        width: 70px;
        height: auto;
    }

    .site-header .nav {
        display: flex;
        align-items: center;
        gap: 60px;
    }

    .site-header .nav a {
        text-decoration: none;
        font-family: 'Suit', sans-serif;
        font-size: 21px;
        font-weight: 400;
        white-space: nowrap;
        color: #333333;
    }

    .site-header .nav a:hover {
        color: brown;
    }

</style>
<link rel="stylesheet" href="./css.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<link rel="icon" href="./images/favicon.png" type="image/x-icon"/> 
</head>
<body>
   <header class="site-header">
        <!-- 로고 -->
        <a href="welcome.jsp" aria-label="과자월드 홈">
            <img src="./images/logo2.png"
                 alt="과자월드 로고"
                 class="logo">
        </a>

    <nav class="nav">
        <a href="snackList.jsp">과자목록</a>
        <a href="cart.jsp">장바구니</a>
        <a href="sellList.jsp">판매목록</a>
    </nav>
</header>
</body>
</html>