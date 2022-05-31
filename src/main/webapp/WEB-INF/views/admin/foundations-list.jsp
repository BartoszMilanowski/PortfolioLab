<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Pulpit administratora</h1>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Lista fundacji</h6>
        </div>
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Nazwa fundacji</th>
                    <th scope="col">Opis fundacji</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="foundation">
                    <tr>
                        <td>${foundation.name}</td>
                        <td>${foundation.description}</td>
                        <td><a href="" class="d-none d-inline-block btn btn-sm btn-primary shadow-sm">Edytuj</a></td>
                        <td><a href="" class="d-none d-inline-block btn btn-sm btn-primary shadow-sm">Usuń
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="/admin/foundation/add" class="d-none d-inline-block btn btn-sm btn-primary shadow-sm">Dodaj fundację</a>
    </div>
    <a href="/admin/" class="d-none d-inline-block btn btn-sm btn-primary shadow-sm">Wróć</a>
</div>
</body>
</html>