module SessionsController
  class Action < ApplicationController::Action
    expose(:user) { User.find_by_email(params[:session][:email]) }
  end

  class New < Action
  end

  class Create < Action
    def call
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to(home_path)
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  class Destroy < Action
    def call
      log_out if logged_in?
      redirect_to(home_path)
    end
  end
end

