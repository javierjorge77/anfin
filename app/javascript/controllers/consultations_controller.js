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
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjAsImZpcnN0TmFtZSI6Ikp1YW4gUGVkcm8iLCJyb2xlSWQiOjIsImNvcnBvcmF0aW9uSWQiOjY5fQ.-dQREkAvQE04-kpjdyMplR4BnrLabrm9pbNVkcT122A"
      }
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }
}
