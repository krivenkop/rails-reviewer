import ProfileDropdown from './components/profile-dropdown';
import UserCard from "./components/user-card";

export default class Application {
    constructor() {
        this.components = {};

        this.loadComponents()
    }

    loadComponents() {
        this.components['profile-dropdown'] = new ProfileDropdown('.profile-dropdown', this.components, {
            hiddenClass: 'profile-dropdown--hidden'
        });
        this.components['user-card'] = new UserCard('.user-card', this.components);
    }
}