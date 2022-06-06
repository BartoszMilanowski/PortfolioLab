<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <nav class="container container--70">
        <ul class="nav--actions">
            <sec:authorize access="isAnonymous()">
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/zarejestruj-sie" class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li><p>Cześć <sec:authentication property="principal.user.firstName"/></p></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a href="/admin/" class="btn btn--small btn--without-border">Panel administratora</a></li>
                </sec:authorize>
                <li><a href="/przekaz-dary/moje-dary" class="btn btn--small btn--without-border">Moje dary</a></li>
                <li><a href="/moje-konto" class="btn btn--small btn--without-border">Moje konto</a></li>
                <li>
                    <form action="/logout" method="post">
                        <input type="submit" value="Wyloguj" class="btn btn--small btn--highlighted"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </li>
            </sec:authorize>

        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <sec:authorize access="isAuthenticated()">
                <li><a href="/przekaz-dary" class="btn btn--highlighted">Przekaż dary</a></li>
            </sec:authorize>
            <li><a href="/#o-co-chodzi" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/#o-nas" class="btn btn--without-border">O nas</a></li>
            <li><a href="/#fundacje-i-organizacje" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/#kontakt" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>