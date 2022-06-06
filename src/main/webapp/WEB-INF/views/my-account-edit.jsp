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
    <title>Edytuj dane</title>

    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
<body>
<header>
    <%@ include file="fragments/header.jsp"%>
</header>

<section class="login-page">
    <h2>Edytuj dane</h2>
    <form:form method="post"  modelAttribute="user">
        <div class="form-group">
            <form:input path="firstName"/>
            <p style="color: red"></p>
        </div>
        <div class="form-group">
            <form:input path="lastName"/>
            <p style="color: red"></p>
        </div>
        <div class="form-group">
            <form:input path="email"/>
            <p style="color: red"></p>
        </div>
        <form:hidden path="password"/>
        <form:hidden path="id"/>
        <form:hidden path="enabled"/>
        <form:hidden path="roles"/>

        <div class="form-group form-group--buttons">
            <a href="/zmien-haslo" class="btn">Zmień hasło</a>
            <button class="btn" type="submit">Edytuj dane</button>
        </div>
    </form:form>
</section>

<footer>
    <%@ include file="fragments/footer.jsp"%>
</footer>
<%--<script src="js/app.js"></script>--%>
</body>
</html>
