Rails.application.routes.draw do

  focused_controller_routes do
    get '/' => 'users#home', as: :home
    get 'sign_up' => 'users#sign_up', as: :sign_up
    post 'sign_up' => 'users#create'
    get 'sign_in' => 'sessions#new', as: :sign_in
    post 'sign_in' => 'sessions#create'
    delete 'sign_out' => 'sessions#destroy', as: :sign_out

    # Threads
    get 'threads' => 'threads#index', as: :threads
    post 'threads' => 'threads#create', as: :create_thread

    # Messages
    post 'messages' => 'messages#create', as: :messages
  end

end
