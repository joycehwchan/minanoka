import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
  static targets = [ 'startDate','endDate' ];
  static values = {
    price: String,
  }
  
  connect() {
  }
  amount(){
    console.dir(this.price);

  }
}
 