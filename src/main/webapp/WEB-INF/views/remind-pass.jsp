<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Przypomnij hasło</title>

    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
<body>
<header>
    <%@ include file="fragments/header.jsp"%>
</header>
<section class="login-page">
    <h2>Zmień hasło</h2>
    <form:form method="post" action="/przypomnij-haslo">
        <div class="form-group">
            <input name="email" type="email" placeholder="Adres e-mail">
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Przypomnij moje hasło</button>
        </div>
    </form:form>
</section>
<footer>
    <%@ include file="fragments/footer.jsp"%>
</footer>
<script src="js/app.js"></script>
</body>
</html>