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
    <title>Moje dary</title>

    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
<body>
    <header>
        <%@ include file="fragments/header.jsp"%>
    </header>
    <section class="form--steps">
        <div class="form--steps-container">
            <div class="summary">
                <h4>Nieodebrane</h4>
                <c:forEach items="${nonPickedUp}" var="nonPickedUp">
                    <span class="summary--text">Liczba worków: ${nonPickedUp.quantity}, dary: ${nonPickedUp.categories}
                    , dla Fundacji "${nonPickedUp.foundation}", zarejestrowano: ${nonPickedUp.registered}</span>
                </c:forEach>
            </div><br/>
            <div class="summary">
                <h4>Odebrane</h4>
                <c:forEach items="${pickedUp}" var="pickedUp">
                    <span class="summary--text">Liczba worków: ${pickedUp.quantity}, dary: ${pickedUp.categories}
                    , dla Fundacji "${pickedUp.foundation}", ${pickedUp.status}: ${pickedUp.pickedUp}</span>
                </c:forEach>
            </div>
        </div>
    </section>
</body>
</html>