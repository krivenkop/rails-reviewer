Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'home#index', as: 'index'
    resources :countries
  end
  root to: 'home#index'


  devise_for :users, path: '',
             path_names: { sign_out: :logout, sign_in: :login },
             controllers: {
                 registrations: 'users/registrations',
             }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
