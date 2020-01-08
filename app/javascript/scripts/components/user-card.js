import Component from './component';

export default class UserCard extends Component {
    constructor(selector, components) {
        super(selector, components);
    }

    setEventListeners() {
        this.element.addEventListener('click', () => {
            this.components['profile-dropdown'].toggle();
        })
    }
}