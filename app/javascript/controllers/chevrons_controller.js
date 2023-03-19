import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chevrons"
export default class extends Controller {
  static targets = ["explanation"]
  connect() {
    // console.log(this.element)
    // console.log(this.explanationTarget)
  }

  scroll() {
    // console.log(e.currentTarget)
    // console.dir(this.explanationTarget)
    // console.log(window.outerHeight)
    window.scrollTo(0, this.explanationTarget.offsetTop)
  }
}
