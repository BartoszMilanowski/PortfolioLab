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
  <title>Oddam w dobre ręce</title>

  <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
</head>
  <body>
    <header class="header--form-page">
    <%@ include file="fragments/header.jsp"%>

      <div class="slogan container container--90">
        <div class="slogan--item">
          <h1>
            Oddaj rzeczy, których już nie chcesz<br />
            <span class="uppercase">potrzebującym</span>
          </h1>

          <div class="slogan--steps">
            <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
            <ul class="slogan--steps-boxes">
              <li>
                <div><em>1</em><span>Wybierz rzeczy</span></div>
              </li>
              <li>
                <div><em>2</em><span>Spakuj je w worki</span></div>
              </li>
              <li>
                <div><em>3</em><span>Wybierz fundację</span></div>
              </li>
              <li>
                <div><em>4</em><span>Zamów kuriera</span></div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>

    <section class="form--steps">
      <div class="form--steps-instructions">
        <div class="form--steps-container">
          <h3>Ważne!</h3>
          <p data-step="1" class="active">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="2">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="3">
           Wybierz jedną, do
            której trafi Twoja przesyłka.
          </p>
          <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
      </div>

      <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form method="post" modelAttribute="donation" action="/przekaz-dary" id="doantionForm">
          <!-- STEP 1: class .active is switching steps -->
          <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>

            <c:forEach items="${categories}" var="category">
              <div class="form-group form-group--checkbox" id="donationsDiv">
                <label>
                  <input type="checkbox" name="categories" value="${category.id}" id="checkbox">
                  <span class="checkbox"></span>
                  <span class="description">${category.name}</span>
                </label>
              </div>
            </c:forEach>
            <p style="color: red"></p>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 2 -->
          <div data-step="2">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline" id="quantityDiv">
              <label>
                Liczba 60l worków:&nbsp;
                <form:input path="quantity" id="quantity"/>
              </label>
            </div>
            <p style="color: red"></p>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>



          <!-- STEP 3 -->
          <div data-step="3">
            <h3>Wybierz organizacje, której chcesz pomóc:</h3>

            <c:forEach items="${institutions}" var="institution">
              <div class="form-group form-group--checkbox" id="institutionsDiv">
                <label>
                  <form:radiobutton path="institution" value="${institution.id}" id="radio"/>
                  <span class="checkbox radio"></span>
                  <span class="description">
                    <span class="title">Fundacja "${institution.name}"</span><br/>
                    <span class="subtitle">${institution.description}</span>
                  </span>
                </label>
              </div>
            </c:forEach>
            <p style="color: red"></p>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 4 -->
          <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

            <div class="form-section form-section--columns">
              <div class="form-section--column">
                <h4>Adres odbioru</h4>
                <div class="form-group form-group--inline" id="streetDiv">
                  <label> Ulica <form:input path="street" id="street"/> </label>
                  <p style="color: red"></p>
                </div>

                <div class="form-group form-group--inline" id="cityDiv">
                  <label> Miasto <form:input path="city" id="city"/> </label>
                  <p style="color: red"></p>
                </div>

                <div class="form-group form-group--inline" id="zipCodeDiv">
                  <label>
                    Kod pocztowy <form:input path="zipCode" id="zipCode"/>
                  </label>
                  <p style="color: red"></p>
                </div>

                <div class="form-group form-group--inline" id="phoneDiv">
                  <label>
                    Numer telefonu <form:input type="phone" path="phoneNumber" id="phone"/>
                  </label>
                  <p style="color: red"></p>
                </div>
              </div>

              <div class="form-section--column">
                <h4>Termin odbioru</h4>
                <div class="form-group form-group--inline" id="dateDiv">
                  <label> Data <form:input type="date" path="pickUpDate" id="date"/> </label>
                  <p style="color: red"></p>
                </div>

                <div class="form-group form-group--inline" id="timeDiv">
                  <label> Godzina <form:input path="pickUpTime" type="time" id="time"/> </label>
                  <p style="color: red"></p>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Uwagi dla kuriera
                    <form:textarea path="pickUpComment" rows="5" id="comment"/>
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 5 -->
          <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
              <div class="form-section">
                <h4>Oddajesz:</h4>
                <ul>
                  <li>
                    <span class="icon icon-bag"></span>
                    <span class="summary--text" id="donation"></span>
                  </li>

                  <li>
                    <span class="icon icon-hand"></span>
                    <span class="summary--text" id="for"></span>
                  </li>
                </ul>
              </div>

              <div class="form-section form-section--columns">
                <div class="form-section--column">
                  <h4>Adres odbioru:</h4>
                  <ul id="pickUpPlace">
                  </ul>
                </div>

                <div class="form-section--column">
                  <h4>Termin odbioru:</h4>
                  <ul id="pickUpDate">
                  </ul>
                </div>
              </div>
            </div>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="submit" class="btn">Potwierdzam</button>
            </div>
          </div>
        </form:form>
      </div>
    </section>

    <footer>
      <%@ include file="fragments/footer.jsp"%>
    </footer>
    <script src="js/app.js"></script>
  </body>
</html>
