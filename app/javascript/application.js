// Entry point for the build script in your package.json
import '@hotwired/turbo-rails'
import '@fortawesome/fontawesome-free/js/all'
import './controllers'
import './jquery'
import * as bootstrap from "bootstrap"
import '@nathanvda/cocoon'

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
