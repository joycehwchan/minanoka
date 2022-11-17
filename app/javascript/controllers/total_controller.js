import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
 static targets = [ "price","amount", "all" , "startDay", "endDay"]

  connect() {
    console.log(this.endDayTarget.value)
    console.log(this.amountTarget.value)
    console.log(this.startDayTarget)
    console.log(this.endDayTarget)

    console.log(this.priceTarget.innerText)
  }

  calculate(){

  const startDay = new Date(this.startDayTarget.value)
  const endDay = new Date(this.endDayTarget.value)
  const days = (endDay - startDay) / (1000 * 3600 * 24) + 1

  console.log(days);
  let total = 0
  if(isNaN(days)){
  total = 0;
}
  // this.daysTarget.innerText = days
  const price = parseInt(this.priceTarget.innerText)
   total = days * price
  if(isNaN(total)){
  total = 0;
}
  this.amountTarget.innerText = total

}
}
 