class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    helper_method :current_user  

    def current_user

        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
        
    end

    def user_role

        if session[:user_id]
            @user_role ||= User.find(session[:user_id]).current_user_role
        else
            @user_role = nil
        end

    end

end
