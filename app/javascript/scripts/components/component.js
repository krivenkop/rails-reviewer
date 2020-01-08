export default class Component {
    constructor(selector, components) {
        document.addEventListener('DOMContentLoaded', () => {
            this.element = document.querySelector(selector);
            this.components = components;

            this.setEventListeners()
        });
    }

    setEventListeners() {
    }
}