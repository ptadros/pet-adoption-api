Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

 get '/', to: redirect('/api-docs')

    namespace :api do
      namespace :v1 do
        resources :animal_shelters, only: [:create, :destroy] do
          resources :workers, only: [:create, :destroy]
          resources :animals, only: [:index, :create, :show, :destroy] do
            member do
              post :adaptable
              post :remove_adaptable
              get :adopting_persons
            end
          end
        end
      end
    end
end
