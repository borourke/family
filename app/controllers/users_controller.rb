module UsersController
  class Action < ApplicationController::Action
  end

  class Home < Action
    def call
    end
  end

  class Create < Action
    expose(:user) { User.new(new_user_params) }

    def call
      if user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to home_path
      else
        render 'SignUp'
      end
    end

    def new_user_params
      params.require(:user).permit(:name, :email, :password, 
        :password_confirmation, :address, :phone)
    end
  end

  class SignUp < Action
    expose(:user) { User.new }

    def call
    end
  end
end