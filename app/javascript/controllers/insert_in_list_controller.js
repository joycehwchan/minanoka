import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
   static targets = ['itemsList']
  connect() {
    console.log("hi from insert-in-list");
  }

  submit(event) {
    event.preventDefault() // We prevent the form from submitting normally

    const form = event.target // We retrieve the form element from the event

    const url = form.action // The `action` attribute of the form is the path to create
    const options = {
      method: form.method,
      headers: { Accept: 'application/json' },
      body: new FormData(form) // This grabs and correctly formats the data from the form's inputs
    }

    fetch(url, options)
    .then(response => response.json())
    .then(data => {
      if(data.item_html) {
        // We insert a new item if the `item_html` key exists
        this.itemsListTarget.insertAdjacentHTML('afterBegin', data.item_html)
      }
      // We update the form element with the re-rendered one
      form.outerHTML = data.form_html
    })
  }
}
