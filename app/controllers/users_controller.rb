class UsersController < ApplicationController
    before_action :require_permission, only: [:edit]
    skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render 'new'
        end
    end
    def show
        @user = User.find(params[:id])
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @user}
        end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password, :password_confirmation, :first_name, :last_name, :bio)
    end

    def require_permission
        if current_user != User.find(params[:id])
          redirect_to user_path(params[:id]), :flash => {error: "Permission Denied"}
        end
    end

end
