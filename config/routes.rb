Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#landing"

  resources :restos do
    resources :meetings, only: :create, controller: "restos/meetings"
    resources :meeting_intents, only: %i[create new], controller: "restos/meeting_intents"
  end

  resources :participations, only: %i[ index create destroy]
end
