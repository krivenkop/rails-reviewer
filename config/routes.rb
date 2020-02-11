Rails.application.routes.draw do
  namespace :profile do
    get 'my/index'
    get 'my/edit'
    get 'my/update'
  end
  namespace :admin do
    get '/', to: 'home#index', as: 'index'

    resources :countries, :users, constraints: { id: /[0-9]+/ },
              except: [:show]

    resources :carriers, constraints: { id: /[0-9]+/ },
              only: [:index, :create, :destroy]
    get 'countries/update-all', to: 'countries#update_all', as: 'update_all'
  end

  scope '/profile' do
    get '/', to: 'profile#show', as: 'profile_my'
    get '/:id', to: 'profile#show', as: 'profile_show'
  end

  root to: 'home#index'

  devise_for :users, path: '',
             path_names: { sign_out: :logout, sign_in: :login },
             controllers: {
                 registrations: 'users/registrations',
             }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
