class RepliesController < ApplicationController
    before_action :find_post, only: [:create, :new, :edit, :update, :destroy]
    before_action :find_comment, only: [:create, :new, :edit, :update, :destroy]
    before_action :find_reply, only: [:edit, :update, :destroy]


    def create 
        @reply = Reply.new(replies_params)
        @reply.user_id = current_user.id
        @reply.comment_id = params[:comment_id]
        if @reply.save
            redirect_to post_path(@post)
        else 
            render '/posts/show'
        end
    end

    def new
        # if params[:post_id] && @post = Post.find_by_id(params[:post_id])
        #     @reply = @post.comments.replies.build
        # else
        #     @error = "That post doesn't exist!" if params[:post_id]
        #     @reply = Reply.new
        # end
        # @post = Post.find_by_id(params[:post_id])
        # @comment = Comment.find_by_id(params[:comment_id])
        @reply = Reply.new
    end

    def edit
    end

    def update
        if @reply.update(replies_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def destroy
        @reply.destroy
        redirect_to post_path(@post)
    end

    private 

    def find_post
        @post = Post.find_by_id(params[:post_id])
    end

    def find_comment
        @comment = Comment.find_by_id(params[:comment_id])
    end

    def find_reply
        @reply = Reply.find_by_id(params[:id])
    end

    def replies_params
        params.require(:reply).permit(:text, :user_id, :comment_id)
    end

end
