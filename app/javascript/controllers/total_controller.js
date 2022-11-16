import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
  static targets = [ 'startDate','endDate' ]
  connect() {
    console.log("hi ");
  }
  amount(){
    console.dir(this.startDateTarget.value);

  }
}
 