Rails.application.routes.draw do

  namespace :generated do
    resources :loulous
  end
  namespace :generated do
    resources :tintins
  end
  namespace :generated do
    resources :riris
  end


  namespace :generated do
    resources :fifis
  end


  namespace :generated do
    resources :tutus
  end
  namespace :generated do
    resources :titis
  end
  namespace :generated do
    end

  resources :things

  root to: 'import_data#index'

  devise_for :users
  get 'import_data/index'
  post 'import_data/upload'
  get "live_search/search"

#  get 'heartbeat' => "custom_controller#heartbeat"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
