import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="consultations"
export default class extends Controller {
  static targets = ["form"]
  requestRut(event) {
    event.preventDefault()
    fetch("https://api.sheriffqa.keiron.cl/api/v1/integration/helper/judicial/12470886-9", {
      method: "GET",
      headers: {
        accept: "aplication/json",
        "Authorization": "Bearer ${ENV['API_BEARER']}"
      }
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }
}
