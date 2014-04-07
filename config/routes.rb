Atm::Application.routes.draw do

  root to: 'users#home'

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
