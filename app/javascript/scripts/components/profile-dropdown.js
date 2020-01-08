import Component from './component';

export default class ProfileDropdown extends Component {
    constructor(selector, components) {
        super(selector, components);
        this.hiddenClass = 'profile-dropdown--hidden';
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