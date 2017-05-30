Rails.application.routes.draw do
  devise_for :users
  # API Routes path
    namespace :api, defaults: { format: :json } do 
        namespace :v1 do
            resources :users, :only => [:show, :create, :update, :destroy]
        end
    end
end
