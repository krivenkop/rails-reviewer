import Component from './component';

export default class UserCard extends Component {
    constructor(selector, components, settings = {}) {
        super(selector, components, settings);
    }

    setEventListeners() {
        this.element.addEventListener('click', () => {
            this.components['profile-dropdown'].toggle();
        })
    }
}