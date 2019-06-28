class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:home, :new, :create, :omniauth]
    
    def home
        @events = Event.ten_closest
    end

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
        redirect_to root_path
    end

    def logoff
        session.delete :user_id
        redirect_to root_path
    end

    def omniauth
        @user = User.from_omniauth(auth)
        #binding.pry
        @user.save
        session[:user_id] = @user.id
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end
