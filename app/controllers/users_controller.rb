class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to :new_user
        end
    end

    def welcome
    
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password, :password_confirmation, :first_name, :last_name)
    end


end
