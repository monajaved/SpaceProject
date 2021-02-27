class UsersController < ApplicationController

    def index
        # binding.pry
        @post = Post.find_by_id(params[:post_id])
        @users = @post.users.uniq
    end



    def show 
        @user = User.find_by_id(params[:id])
    end

end
