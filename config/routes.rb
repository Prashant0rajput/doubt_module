Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :doubts do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'doubts#index'

  get 'doubts/:id/answer'=> 'doubts#answer'
  post '/doubts/:id/escalate' => 'doubts#escalate'
end
