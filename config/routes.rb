Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :account_book, only: [] do
    collection do
      post :create_sync
      post :create_parallel
    end
  end
end
