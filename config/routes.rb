Rails.application.routes.draw do
  root 'axes#index'
  devise_for :users, class_name: 'FormUser', 
        :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :axes do
    post 'toggle_like'
  end
  get 'users/:id/rig' => 'axes#rig', as: 'user_rig'
end
