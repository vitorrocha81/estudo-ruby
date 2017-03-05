Rails.application.routes.draw do
  namespace :backoffice do
	get 'dashboard/index'
  end

  devise_for :admins
  devise_for :members
 get 'home/index'
 root 'home#index'
end
