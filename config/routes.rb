Rails.application.routes.draw do
  devise_for :users
  # API Routes path
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end
end
