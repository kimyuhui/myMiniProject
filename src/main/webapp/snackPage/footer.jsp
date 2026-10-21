<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
footer {
    position: static;
    scroll-snap-align: none;
    scroll-snap-stop: normal;
    
    width: 100%;
    padding: 45px 8%;
    background: #fffaf2;
    color: #5c4033;
}

.footer-inner {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    gap: 70px;
}

.footer-logo {
    flex: 0 0 200px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.footer-logo img {
    width: 180px;
    height: auto;
    display: block;
}

.footer-info {
    flex: 1;
    font-size: 14px;
    line-height: 1.8;
}

.footer-info h3 {
    margin: 0 0 10px;
    font-size: 20px;
    color: #5c4033;
}

.footer-info p {
    margin: 5px 0;
}

.footer-info a {
    color: #8b6b52;
    text-decoration: none;
}

.footer-info a:hover {
    text-decoration: underline;
}

.footer-info span {
    margin-left: 20px;
}

.footer-links {
    display: flex;
    gap: 20px;
    margin-top: 15px;
}

.footer-info .copyright {
    margin-top: 15px;
    font-size: 12px;
    color: #9c8472;
    letter-spacing: 0.5px;
}

</style>
<body>
<footer class="site-footer">
    <div class="footer-inner">

        <div class="footer-logo">
            <a href="welcome.jsp">
                <img src="./images/logo2.png" alt="까까나라 로고">
            </a>
        </div>

        <div class="footer-info" style = "font-family: 'Suit', sans-serif;">
            <h3 style = "font-weight: 500;">㈜까까나라</h3>

           		<p>
                까까광역시 까까구 까까로 10-16
                </p>

            <p>
                Tel : 062-266-6617
                <span>Fax : 062-266-6617</span>
            </p>

            <p>사업자등록번호 : 409-85-16860</p>

            <div class="footer-links">
                <p>
                    개인정보처리방침
                </p>

                <p>
                    이메일무단수집거부
                </p>
            </div>

            <p class="copyright">
                COPYRIGHT © KAKANARA ALL RIGHTS RESERVED
            </p>
        </div>

    </div>
</footer>
</body>
</html>