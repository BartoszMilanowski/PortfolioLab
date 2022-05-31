<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Panel administratora</title>

    <link rel="stylesheet" href="<c:url value="/css/sb-admin-2.css"/>"/>
</head>
<body>
<%@include file="admin-header.jsp"%>
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Dodaj fundację</h6>
        </div>
        <form:form cssClass="user" modelAttribute="institution" method="post" id="fundForm">
            <div class="form-group"><br/><br/>
                <span>&nbsp;Nazwa: <form:input path="name" id="name" /></span><br/><br/>
                <p id="nameError" style="color: red"></p>
                <span>&nbsp;Opis: <form:textarea path="description" id="description"/></span><br/><br/>
                <p id="descError" style="color: red"></p>
                </span><br/><br/>
                &nbsp;<input type="submit" value="Dodaj"
                             class="d-none d-inline-block btn btn-sm btn-primary shadow-sm">
            </div>
        </form:form>
    </div>
</div>
<script src="/js/app.js"></script>
</body>
</html>