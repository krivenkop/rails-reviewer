export default class Component {
    constructor(selector, components, settings = {}) {
        document.addEventListener('DOMContentLoaded', () => {
            this.element = document.querySelector(selector);
            this.components = components;
            this.hiddenClass = (settings.hiddenClass || '');

            this.setEventListeners()
        });
    }

    setEventListeners() {
    }

    toggle() {
        if (this.element.classList.contains(this.hiddenClass)) {
            this.show();
        } else {
            this.hide();
        }
    }

    show() {
        this.element.classList.remove(this.hiddenClass)
    }

    hide() {
        this.element.classList.add(this.hiddenClass);
    }
}