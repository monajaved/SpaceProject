class SessionsController < ApplicationController
    def new
    end

    def create 
        @user = User.find_by_email(params[:email])

        if @user && @user.authenticate(params[:password])
            login_user
            redirect_to posts_path
        else
            flash.now[:error] = ["Username or Password must match"]
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end
