class CommentsController < ApplicationController
    before_action :find_post, only: [:create, :new, :edit, :update, :destroy]
    before_action :find_comment, only: [:new, :edit, :update, :destroy]
    
    def new
        @comment = Comment.new
    end

    def create 
        @comment = Comment.new(comments_params)
        @comment.user_id = current_user.id
        @comment.post_id = params[:post_id]
    
        if @comment.save  
            redirect_to post_path(@post)
        else 
            render :new
        end
    end

    def edit
    end

    def update
        if @comment.update(comments_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end
    
    def destroy
        @comment.destroy
        redirect_to post_path(@post)
    end

    private 
    
    def find_post
        @post = Post.find_by_id(params[:post_id])
    end

    def find_comment
        @comment = Comment.find_by_id(params[:id])
    end

    def comments_params
        params.require(:comment).permit(:text, :user_id, :post_id)
    end

  
end
