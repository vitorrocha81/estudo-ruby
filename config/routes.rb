Rails.application.routes.draw do
  
  namespace :site do
  namespace :profile do
    get 'ads/index'
    end
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, execpt: [:show]
    resources :admins, execpt: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
  	get 'home', to: 'home#index'

    # perfil do membro
    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads
    end
    # fim do perfil do membro

  end

  devise_for :admins, skip: [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions'}

  root 'site/home#index'
end