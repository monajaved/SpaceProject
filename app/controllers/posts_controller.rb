class PostsController < ApplicationController
    before_action :find_user, only: [:index, :create]
    before_action :authenticate_user!, only: [:show, :create, :edit]
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

  
    def show 
        @comment = Comment.new
        @reply = Reply.new
    end

    # def create 
    #     # binding.pry
    #     # @user = User.find(params[:user_id])
    #     @post = Post.new(post_params)
    #     # @post = current_user.posts.new(post_params)
    #     if @post.save
    #             redirect_to posts_path(current_user)
    #     else
    #         flash.now[:error] = @post.errors.full_messages  
    #         render :new
    #     end

    # end

    def edit 
        # if params[:user_id]
        # user = User.find_by(id: params[:user_id])
        @post = Post.find_by_id(params[:post_id])
        # @comment = Comment.find_by_id(params[:id])
        @comment = current_user.comments.find_by_id(params[:id])
        @comment.user_id = current_user.id

        #     if @post = user.posts.find_by(id: params[:id])
        #         redirect_to post_path(@post), alert: "Post not found." if @post.nil?
        #     end
        # else
        #     @post = Post.find(params[:id])
        # end
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
