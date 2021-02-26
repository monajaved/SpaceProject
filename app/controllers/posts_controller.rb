class PostsController < ApplicationController
    before_action :find_user, only: [:index, :create]
    before_action :authenticate_user!, only: [:show, :create, :edit]
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        if !params[:query].blank?
            @posts = Post.search_post(params[:query])
        else
            @posts = Post.all
        end

    end

  
    def show 
        @comment = Comment.new
        @reply = Reply.new
    end


    def edit 
        @post = Post.find_by_id(params[:post_id])
    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            flash.now[:error] = @post.errors.full_messages
            render :edit
        end
    end

 

    private
    def find_user
        @user = User.find_by_id(params[:id])
    end

    def find_post
        @post = Post.find_by_id(params[:id])
    end

    def post_params
        params.require(:post).permit(
            :date,
            :explanation,
            :url,
            :title
        )
    end
end
