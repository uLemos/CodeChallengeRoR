Rails.application.routes.draw do
  root to: "news#search"

  get "save_for_later/create"
  devise_for :users

  post "save_for_later", to: "save_for_later#create", as: "save_for_later"

  resources :news, only: [ :index ] do
    collection do
      get "search"
      get "read_later", action: :read_later
    end

    resources :read_laters, only: [ :destroy ]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
