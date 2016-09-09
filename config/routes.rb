Rails.application.routes.draw do

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  root 'sessions#new'

  resources :users
  resources :departamentos
  #post "/produtos" => "produtos#create"
  #get "/produtos/new" => "produtos#new"
  #delete "/produtos/:id" => "produtos#destroy", as: :produto
  # - resources equivalente as rotas acima.
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  #root "produtos#index"

end
