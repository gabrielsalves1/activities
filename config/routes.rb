Rails.application.routes.draw do
  root 'home#index'
  resources :activities, only: [:show, :new, :create, :edit, :update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :activities, only: %i[index show create]
    end
  end
end
