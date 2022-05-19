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
      const errors = document.querySelectorAll("#error");
      for(let i = 0; i < errors.length; i++){
        errors[i].remove();
      }
      switch (this.currentStep){
        case 1:
        const checked = document.querySelectorAll("input[id='checkbox']:checked");
        if (checked.length === 0){
          const div = document.querySelector("div[data-step='1']");
          let p = document.createElement("h3");
          p.style.color = "red";
          p.innerHTML = "<br/>Zaznacz rodzaj przekazywanych darów!";
          div.appendChild(p);
          return false;
        } else {
          return true;
        }
        case 2:
       const quantity = document.querySelector("input[id='quantity']").value;
       if (quantity < 1 || !Number.isInteger(parseInt(quantity))){
         const div = document.querySelector("div[data-step='2']");
         let p = document.createElement("h3");
         p.style.color = "red";
         p.setAttribute("id", "error");
         p.innerHTML = "<br/>Podaj liczbę przekazywanych worków!";
         div.appendChild(p);
         return false;
       } else {
         return true;
       }
        case 3:
        const institution = document.querySelectorAll("input[id='radio']:checked");
        if (institution.length === 0){
          const div = document.querySelector("div[data-step='3']");
          let p = document.createElement("h3");
          p.style.color = "red";
          p.setAttribute("id", "error");
          p.innerHTML = "<br/>Wybierz fundację, której chcesz przekazać dary!";
          div.appendChild(p);
          return false;
        } else {
          return true;
        }
        case 4:
        let errors = [];
        const street = document.querySelector("input[id='street']").value;
        if (street === ""){
          errors.push("adres odbioru");
        }
        const city = document.querySelector("input[id='city']").value;
        if (city === ""){
          errors.push("miasto odbioru");
        }
        const zipCode = document.querySelector("input[id='zipCode']").value;
        if (zipCode === ""){
          errors.push("kod pocztowy");
        }
        const phone = document.querySelector("input[id='phone']").value;
        if (phone === ""){
          errors.push("numer kontaktowy");
        }
        const date = document.querySelector("input[id='date']").value;
        if (date === ""){
          errors.push("preferowaną datę odbioru");
        }
        const time = document.querySelector("input[id='time']").value;
        if (time === ""){
          errors.push("preferowaną godzinę odbioru");
        }
        if (errors.length !== 0){
          const div = document.querySelector("div[data-step='4']");
          let p = document.createElement("h3");
          p.style.color = "red";
          p.setAttribute("id", "error");
          p.innerHTML = "<br/>Uzupełnij: " + errors.join(", ") + "!";
          div.appendChild(p);
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

      const donationLi = document.querySelector("#donation");
      const donationText = document.createElement("span");
      donationText.classList.add("summary--text");
      donationText.innerHTML = quantity + " worki: " + categories.join(", ") + ".";
      donationLi.appendChild(donationText);

      const forLi = document.querySelector("#for");
      const forText = document.createElement("span");
      forText.classList.add("summary--text");
      forText.innerHTML = "Dla: " + institution + ".";
      forLi.appendChild(forText);

      const placeUl = document.querySelector("#pickUpPlace");
      const streetLi = document.createElement("li");
      const cityLi = document.createElement("li");
      const zipCodeLi = document.createElement("li");
      const phoneLi = document.createElement("li");
      streetLi.innerHTML = street;
      cityLi.innerHTML = city;
      zipCodeLi.innerHTML = zipCode;
      phoneLi.innerHTML = phone;
      placeUl.appendChild(streetLi);
      placeUl.appendChild(cityLi);
      placeUl.appendChild(zipCodeLi);
      placeUl.appendChild(phoneLi);

      const dateUl = document.querySelector("#pickUpDate");
      const dateLi = document.createElement("li");
      const timeLi = document.createElement("li");
      const commentLi = document.createElement("li");

      dateLi.innerHTML = date;
      timeLi.innerHTML = time;

      if (comment === ""){
        commentLi.innerHTML = "Brak uwag"
      } else {
        commentLi.innerHTML = comment;
      }
      dateUl.appendChild(dateLi);
      dateUl.appendChild(timeLi);
      dateUl.appendChild(commentLi);
    }
  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }
});