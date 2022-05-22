<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>Oddam w dobre ręce</title>

  <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
  <body>
    <header>
      <%@ include file="fragments/header.jsp"%>
    </header>

    <section class="login-page">
      <h2>Zaloguj się</h2>
      <form method="post">
        <div class="form-group">
          <input type="text" name="username" placeholder="Email"/>
        </div>
        <div class="form-group">
          <input type="password" name="password" placeholder="Hasło" />
          <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>
        <div class="form-group form-group--buttons">
          <a href="/zarejestruj-sie" class="btn btn--without-border">Załóż konto</a>
          <button class="btn" type="submit">Zaloguj się</button>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
      </form>
    </section>

    <footer>
      <%@ include file="fragments/footer.jsp"%>
      </footer>
  </body>
</html>
