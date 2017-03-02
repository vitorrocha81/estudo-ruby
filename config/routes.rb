Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
 get 'home/index'
 root 'home#index'
end
