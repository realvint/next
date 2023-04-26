// Entry point for the build script in your package.json
import '@hotwired/turbo-rails'
import '@fortawesome/fontawesome-free/js/all'
import './controllers'
import * as bootstrap from "bootstrap"
import '@nathanvda/cocoon'

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

document.addEventListener('turbo:load', () => {
  $('body').on('click', '.add_fields', (e) => {
    if ($('#phones .nested-fields:visible').length < 3) {
      return true
    } else {
      alert('Максимум 4 номера')
      return false
    }
  })
})
