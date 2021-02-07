class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show 
        @user = User.find_by_id(params[:id])
    end

    def new
        @user = User.new
        @user.posts.build
        @user.posts.build
    end


    def create 
        @user = User.new(user_params)
        if @user.save
            login_user
            redirect_to posts_path
        else
            flash.now[:error] = @user.errors.full_messages
            render :new
        end
    end


private
    def user_params
        params.require(:user).permit(
            :email,
            :password,
            :username,
            :password,
            post_attributes: [:title, :date, :explanation, :url]
        )
    end


end
