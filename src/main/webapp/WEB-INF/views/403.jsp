<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Brak dostępu</title>

    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
<body>
<header class="header--form-page">
    <%@ include file="fragments/header.jsp"%>

    <div class="slogan container container--90">
        <h2>
            Niestety nie posiadasz dostępu do danej treści.<br/>
            Jeżeli uważasz, że wynika to z błędu, skontaktuj się z administratorem.<br/><br/>
            <a href="/" class="btn btn--highlighted">Strona główna</a>
        </h2>
    </div>

</header>

<footer>
    <%@ include file="fragments/footer.jsp"%>
</footer>
<script src="js/app.js"></script>
</body>
</html>
