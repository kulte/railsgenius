RapgeniusLite::Application.routes.draw do
  root to: 'static#index'

  get 'users/edit', to: 'users#edit', as: :edit_current_user
  devise_for :users
  resources :users

  resources :talks

  get '/:id', to: 'annotations#show', constraints: { id: /\d+/ }
  resources :annotations do
    member do
      get 'tooltip'
    end
  end
end
