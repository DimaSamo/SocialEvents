module ApplicationHelper

    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to perform this action."
          redirect_to login_path
        end
    end
    

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def my_resource?(resource)
        if !resource.is_a?(User)
            if resource.user_id == current_user.id
                return true
            else
                return false
            end
        else
            if resource.id == current_user.id
                return true
            else
                return false
            end
        end
    end
end
