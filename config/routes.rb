Atm::Application.routes.draw do

  root to: 'users#home'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  scope '/users', controller: :users do
    get   '/' => :index
    post  'new' => :new
    get   '/:id/matches' => :matches
    post  '/pay' => :pay
  end

  scope '/matches', controller: :matches do
    get '/' => :index
  end

end