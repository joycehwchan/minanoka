import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
 static targets = [ "price","totalPrice", "startDay", "endDay", "days"]

  connect() {
    // console.log(this.totalPriceTarget.value)
    // console.log(this.startDayTarget)
    // console.log(this.endDayTarget)
    // console.log(this.priceTarget.innerText)
    // console.log(this.daysTarget.innerText)
    
  }

  calculate(){

  const startDay = new Date(this.startDayTarget.value)
  const endDay = new Date(this.endDayTarget.value)
  let days = (endDay - startDay) / (1000 * 3600 * 24) + 1

  console.log(days);
  let total = 0
  if(isNaN(days)){
  total = 0
  days = 0
}
  // this.daysTarget.innerText = days
  const price = parseInt(this.priceTarget.innerText)
   total = days * price
  if(isNaN(total)){
  total = 0
  days = 0
}
console.log(days)
  this.totalPriceTarget.innerText = total
  this.daysTarget.innerText = days

}
}
 