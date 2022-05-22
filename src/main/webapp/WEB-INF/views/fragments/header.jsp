<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <nav class="container container--70">
        <ul class="nav--actions">
            <sec:authorize access="isAnonymous()">
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/zarejestruj-sie" class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
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
            <li><a href="/#o-co-chodzi" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/#o-nas" class="btn btn--without-border">O nas</a></li>
            <li><a href="/#fundacje-i-organizacje" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/#kontakt" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>