Rails.application.routes.draw do

  focused_controller_routes do
    get '/' => 'users#home', as: :home
  end

end
