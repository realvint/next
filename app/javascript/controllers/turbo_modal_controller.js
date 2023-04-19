import { Controller } from '@hotwired/stimulus'
import { Modal } from 'bootstrap'

// Очищаем фрейм от модалки
document.addEventListener("turbo:before-cache", function() {
  // remove modal since it will be opened automatically on connect
  // we need to do that by removing parent turbo-frame id='modal' which has src
  let modals = document.querySelectorAll('[data-controller="turbo-modal"]')
  modals.forEach(function(modal) {
    let parentTurboFrame = modal.closest('turbo-frame')
    if (parentTurboFrame) {
      parentTurboFrame.innerHTML = ''
      parentTurboFrame.src = null
    } else {
      modal.remove()
    }
  })
})

export default class extends Controller {
  connect() {
    console.log('Контроллер turbo-modal подключен')

    this.modal = new Modal(this.element)
    this.modal.show()

    // Должно очищать фрейм модалки, но нет(
    //
    // this.element.addEventListener('hidden.bs.modal', (event) => {
    //   const modal_frame = document.querySelector('#modal')
    //   if (modal_frame) modal_frame.src = ''
    // })

    const myInput = document.querySelector('.focus-input')
    document.addEventListener('shown.bs.modal', function () {
      myInput.focus()
    })
  }

  isOpen() {
    return this.element.classList.contains("show")
  }

  disconnect() {
    console.log('Контроллер turbo-modal отключен')

    this.modal.hide()
  }

  // hide modal
  // action: "turbo-modal#hideModal"

  hideModal() {
    //this.element.parentElement.removeAttribute('src')
    // Remove src reference from parent frame element
    // Without this, turbo won't re-open the modal on subsequent click
    //this.modalTarget.remove()
    this.element.parentElement.removeAttribute('src')
    this.modal.hide()
  }

  // hide modal on successful form submission
  // action: "turbo:submit-end->turbo-modal#submitEnd"

  submitEnd(e) {
    console.log(e.detail.success)

    if (e.detail.success) {
      this.hideModal()
    }
  }

  // hide modal when clicking ESC
  // action: "keyup@window->turbo-modal#closeWithKeyboard"

  closeWithKeyboard(e) {
    if (e.code === 'Escape') {
      this.hideModal()
    }
  }

  // hide modal when clicking outside of modal
  // action: "click@window->turbo-modal#closeBackground"

  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return;
    }
    this.hideModal()
  }
}
