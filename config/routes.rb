Rails.application.routes.draw do
  devise_for :users

  focused_controller_routes do
    get '/' => 'users#home'
  end
end
