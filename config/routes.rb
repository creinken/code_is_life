Rails.application.routes.draw do
    devise_for :users, path_prefix: 'my', controllers: { registrations: 'registrations',
        omniauth_callbacks: 'callbacks' }
    resources :users, only: [:index, :show]
    resources :projects do
        resources :comments, only: [:index, :new, :create, :destroy]
    end
    resources :comments, only: [:index]
    get '/projects/ruby', to: 'projects#show_ruby'
    root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
