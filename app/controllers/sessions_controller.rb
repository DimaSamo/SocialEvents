class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(user_name: params[:user][:user_name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:error] = "Authentication Failed."
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end


end
