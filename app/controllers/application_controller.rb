class ApplicationController < ActionController::Base

    # helper_method :user_signed_in?, :current_user

    # def user_signed_in?
    #     !!session[:user_id]
    # end

    # def current_user
    #     User.find_by_id(session[:user_id]) if user_signed_in?
    # end

    # def login_user
    #     session[:user_id] = @user.id
    # end
    
    # helpers do 
    #     def redirect_if_not_user
    #         redirect_to post_path(@post) unless current_user.id == @comment.user_id
    #     end
    # end
end
