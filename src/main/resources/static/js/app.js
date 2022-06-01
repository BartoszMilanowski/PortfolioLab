document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          if (this.checkFrom()){
            this.currentStep++;
            this.updateForm();
          }
          if(this.currentStep === 5){
            this.getData();
          }
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary
    }

    checkFrom(){
      // const errors = document.querySelectorAll("p");
      // for(let i = 0; i < errors.length; i++){
      //   errors[i].remove();
      // }
      switch (this.currentStep){
        case 1:
        const checked = document.querySelectorAll("input[id='checkbox']:checked")

        if (checked.length === 0){
          const donationsDiv = document.querySelector("#donationsDiv");
          donationsDiv.parentElement.querySelector("p").innerHTML = "Zaznacz rodzaje przekazywanych darów!";
          return false;
        } else {
          return true;
        }
        case 2:
       const quantity = document.querySelector("input[id='quantity']").value;
       if (quantity < 1 || !Number.isInteger(parseInt(quantity))){
         const quantityDiv = document.querySelector("#quantityDiv");
         quantityDiv.parentElement.querySelector("p").innerHTML = "Podaj liczbę przekazywanych worków!";
         return false;
       } else {
         return true;
       }
        case 3:
        const institution = document.querySelectorAll("input[id='radio']:checked");
        if (institution.length === 0){
          const institutionsDiv = document.querySelector("#institutionsDiv");
          institutionsDiv.parentElement.querySelector("p").innerHTML =
              "Wybierz fundację, której chcesz przekazać dary";
          return false;
        } else {
          return true;
        }
        case 4:
        let errors = [];
        const street = document.querySelector("input[id='street']").value;
        if (street === ""){
          document.querySelector("#streetDiv").querySelector("p").innerHTML =
              "Podaj adres odbioru darów: ulica + numer domu!";
          errors.push(1);
        }
        const city = document.querySelector("input[id='city']").value;
        if (city === ""){
          document.querySelector("#cityDiv").querySelector("p").innerHTML =
              "Podaj miasto odbioru darów!";
          errors.push(1);
        }
        const zipCode = document.querySelector("input[id='zipCode']").value;
        if (zipCode === ""){
          document.querySelector("#zipCodeDiv").querySelector("p").innerHTML =
              "Podaj kod pocztowy!";
          errors.push(1);
        }
        const phone = document.querySelector("input[id='phone']").value;
        if (phone === ""){
          document.querySelector("#phoneDiv").querySelector("p").innerHTML =
              "Podaj numer telefonu do kontaktu!";
          errors.push(1);
        }
        const date = document.querySelector("input[id='date']").value;
        if (date === ""){
          document.querySelector("#dateDiv").querySelector("p").innerHTML =
              "Podaj preferowaną datę odbioru darów!";
          errors.push(1);
        }
        const time = document.querySelector("input[id='time']").value;
        if (time === ""){
          document.querySelector("#timeDiv").querySelector("p").innerHTML =
              "Podaj preferowaną godzinę odbioru darów!";
          errors.push(1);
        }
        if (errors.length !== 0){
          return false;
        } else {
          return true;
        }
      }
    }

    getData(){
      const categoriesIds = document.querySelectorAll("input[id='checkbox']:checked");
      const categories = [];
      for (let i = 0; i < categoriesIds.length; i++){
        categories.push(categoriesIds[i].parentElement.querySelector(".description").textContent);
      }
      const quantity = document.querySelector("#quantity").value;
      const institutionId = document.querySelector("input[id='radio']:checked");
      const institution = institutionId.parentElement.querySelector(".title").textContent;
      const street = document.querySelector("#street").value;
      const city = document.querySelector("#city").value;
      const zipCode = document.querySelector("#zipCode").value;
      const phone = document.querySelector("#phone").value;
      const date = document.querySelector("#date").value;
      const time = document.querySelector("#time").value;
      const comment = document.querySelector("#comment").value;

      const donationText = document.querySelector("#donation");
      donationText.innerHTML = "Liczba worków: " + quantity + ", rodzaj darów: " + categories.join(", ") + ".";

      const forText = document.querySelector("#for");
      forText.innerHTML = "Dla: " + institution + ".";

      const pickUpPlace = document.querySelector("#pickUpPlace");
      pickUpPlace.innerHTML = "<li>" + street + "</li><li>"+ city +"</li><li>"+ zipCode +"</li><li>"+ phone +"</li>";


      const pickUpDate = document.querySelector("#pickUpDate");
      if (comment === ""){
        pickUpDate.innerHTML = "<li>" + date + "</li><li>"+ time +"</li><li>Brak uwag</li>";
      } else {
        pickUpDate.innerHTML = "<li>" + date + "</li><li>"+ time +"</li><li>"+ comment +"</li>";
      }

    }
  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);

  }

  class RegisterForm{
    constructor(form) {

      form.addEventListener("submit", e => {
        e.preventDefault();
        if (this.firstName() && this.lastName() && this.email() && this.password() && this.password2()){
          form.submit();
        }
      })
    }
    firstName(){
      const firstName = document.querySelector("#firstName");
      if (firstName.value === ""){
        firstName.parentElement.querySelector("p").innerHTML = "Podaj imię";
        return false;
      } else {
        return true;
      }
    }
    lastName(){
      const lastName = document.querySelector("#lastName");
      if (lastName.value === ""){
        lastName.parentElement.querySelector("p").innerHTML = "Podaj nazwisko";
        return false;
      } else {
        return true;
      }
    }
    email(){
      const email = document.querySelector("#email");
      if (!/(.+)@(.+){2,}\.(.+){2,}/.test(email.value) || email.value === ""){
        email.parentElement.querySelector("p").innerHTML = "Podaj poprawny adres e-mail";
        return false;
      } else {
        return true;
      }
    }
    password(){
      const password = document.querySelector("#password");
      const errors = [];
      if (password.value.length < 8){
        errors.push("Hasło powinno mieć conajmniej 8 znaków!");
      }
      if (!/\d/.test(password.value)){
        errors.push("Hasło powinno zwierać przynajmniej jedną cyfrę!");
      }
      if (!/[a-z]/.test(password.value)){
        errors.push("Hasło powinno zawierać przynajmniej jedną małą literę!");
      }
      if (!/[A-Z]/.test(password.value)){
        errors.push("Hasło powinno zawierać przynajmniej jedna dużą literę!")
      }
      if (errors.length !== 0){
        password.parentElement.querySelector("p").innerHTML =
            errors.join("<br/>");
        return false;
      } else {
        return true;
      }
    }
    password2(){
      const password2 = document.querySelector("#password2");
      const password = document.querySelector("#password");
      if (password2.value !== password.value){
        password2.parentElement.querySelector("p").innerHTML = "Podane hasła nie są takie same!";
        return false;
      } else {
        return true;
      }
    }
  }

  const registerForm = document.querySelector("#registerForm");
  if (registerForm != null){
    new RegisterForm(registerForm);
  }

  class AddFoundationForm{
    constructor(form) {
      form.addEventListener("submit", e => {
        e.preventDefault();
        if (this.checkFoundName() && this.checkFoundDesc()) {
          form.submit();
        }
      })
    }
    checkFoundName(){
       const name = document.querySelector("#name");
       if (name.value === ""){
         name.parentElement.parentElement.querySelector("#nameError").innerHTML = "Podaj nazwę fundacji";
         return false;
       } else {
         return true;
       }
    }
    checkFoundDesc(){
      const desc = document.querySelector("#description");
      if (desc.value === ""){
        desc.parentElement.parentElement.querySelector("#descError").innerHTML = "Podaj opis fundacji";
        return false;
      } else {
        return true;
      }
    }
  }

  const foundationForm = document.querySelector("#fundForm")
  if (foundationForm != null){
    new AddFoundationForm(foundationForm);
  }

  class changePassForm{
    constructor(form) {
      form.addEventListener("submit", e => {
        e.preventDefault();
        if (this.password() && this.password2()){
          form.submit();
        }
      })
    }
    password(){
      const password = document.querySelector("#password");
      const errors = [];
      if (password.value.length < 8){
        errors.push("Hasło powinno mieć conajmniej 8 znaków!");
      }
      if (!/\d/.test(password.value)){
        errors.push("Hasło powinno zwierać przynajmniej jedną cyfrę!");
      }
      if (!/[a-z]/.test(password.value)){
        errors.push("Hasło powinno zawierać przynajmniej jedną małą literę!");
      }
      if (!/[A-Z]/.test(password.value)){
        errors.push("Hasło powinno zawierać przynajmniej jedna dużą literę!")
      }
      if (errors.length !== 0){
        password.parentElement.querySelector("p").innerHTML =
            errors.join("<br/>");
        return false;
      } else {
        return true;
      }
    }
    password2(){
      const password2 = document.querySelector("#password2");
      const password = document.querySelector("#password");
      if (password2.value !== password.value){
        password2.parentElement.querySelector("p").innerHTML = "Podane hasła nie są takie same!";
        return false;
      } else {
        return true;
      }
    }
  }

  const changePass = document.querySelector("#changePassForm");
  if (changePass != null){
    new changePassForm(changePass);
  }
});