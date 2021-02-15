class CommentsController < ApplicationController
    # before_action :correct_user, only: [:edit, :update, :destroy]
    def new
        # @post = Post.find_by_id(params[:post_id])
        # @comment = Comment.new
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @comment = @post.comments.build
        else
            @error = "That post doesn't exist!" if params[:post_id]
            @comment = Comment.new
        end
    end

    def create 
        @post = Post.find_by_id(params[:post_id])
        @comment = Comment.new(comments_params)
        @comment.user_id = current_user.id
        @comment.post_id = params[:post_id]
    
        if @comment.save  
            redirect_to post_path(@post)
        else 
            render '/posts/show'
        end
    end

    def edit
        @post = Post.find_by_id(params[:post_id])
        @comment = Comment.find_by_id(params[:id])
        @comment = current_user.comments.find_by_id(params[:id])
        @comment.user_id = current_user.id
        
    end

    # def show 
    #     @post = Post.find_by_id(params[:post_id])
    #     @comment = Comment.find_by_id(params[:id])
    # end

    def update
        @comment = Comment.find_by_id(params[:id])
        @post = Post.find_by_id(params[:post_id])
        if @comment.update(comments_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end
    
    def destroy
        # redirect_if_not_user
        @post = Post.find_by_id(params[:post_id])
        @comment = Comment.find_by_id(params[:id])
        # @comment = current_user.comments.find_by_id(params[:id])
        @comment.destroy
        # @comment.user_id = current_user.id
        redirect_to post_path(@post)
    end

    private 

    def comments_params
        params.require(:comment).permit(:text, :user_id, :post_id)
    end

    def correct_user
        @comment= Comment.find_by_id(params[:id]) 
        # binding.pry
        unless current_user?(@comment.user)
          redirect_to post_path(@post)
        end
    end
end
# <%= link_to "Reply", post_comment_replies_path(@post, c, @reply)%>