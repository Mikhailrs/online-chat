import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.scrollMessages()
  }
  scrollMessages() {
    const chatContainer = document.getElementById("chat-container")
    if (chatContainer) chatContainer.scrollTop = chatContainer.scrollHeight
  }
}
