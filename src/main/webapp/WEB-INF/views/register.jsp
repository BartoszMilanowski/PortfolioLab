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
  <title>Załóż konto</title>

  <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
  <body>
    <header>
      <%@ include file="fragments/header.jsp"%>
    </header>

    <section class="login-page">
      <h2>Załóż konto</h2>
      <form:form method="post" id="registerForm">
        <div class="form-group">
          <input type="email" name="email" placeholder="Email" id="email"/>
        </div>
        <div class="form-group">
          <input type="password" name="password" placeholder="Hasło" id="password" />
        </div>
        <div class="form-group">
          <input type="password" name="password2" placeholder="Powtórz hasło" id="password2"/>
        </div>

        <div class="form-group form-group--buttons">
          <a href="/login" class="btn btn--without-border">Zaloguj się</a>
          <button class="btn" type="submit">Załóż konto</button>
        </div>
      </form:form>
    </section>

    <footer>
      <%@ include file="fragments/footer.jsp"%>
    </footer>
  </body>
</html>
