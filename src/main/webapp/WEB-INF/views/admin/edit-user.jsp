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
    <title>Panel administratora — lista użytkowników</title>

    <link rel="stylesheet" href="<c:url value="/css/sb-admin-2.css"/>"/>
</head>
<body>
<%@include file="admin-header.jsp"%>
    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Edycja użytkownika</h6>
            </div>
            <form:form cssClass="user" modelAttribute="user" method="post" id="form" action="/admin/user/edit">
                <div class="form-group"><br/><br/>
                    <form:hidden path="id"/>
                    <form:hidden path="password"/>
                    <span>&nbsp;Imię: <form:input path="firstName" id="firstName" /></span><br/><br/>
                    <span>&nbsp;Nazwisko: <form:input path="lastName" id="lastName"/></span><br/><br/>
                    <span>&nbsp;Adres e-mail: <form:input type="email" path="email" id="email"/></span><br/><br/>
                    <c:choose>
                        <c:when test="${admin.equals('admin')}">
                            <span><input type="checkbox" name="admin" checked="checked">&nbsp;Administrator</span>
                        </c:when>
                        <c:otherwise>
                            <span><input type="checkbox" name="admin">&nbsp;Administrator</span>
                        </c:otherwise>
                    </c:choose>
                    </span><br/><br/>
                    &nbsp;<input type="submit" value="Zapisz"
                                 class="d-none d-inline-block btn btn-sm btn-primary shadow-sm">
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>