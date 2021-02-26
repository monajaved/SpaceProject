class RepliesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post, only: [:create, :new, :edit, :update, :destroy]
    before_action :find_comment, only: [:create, :new, :edit, :update, :destroy]
    before_action :find_reply, only: [:edit, :update, :destroy]


    def new
        @reply = Reply.new
    end

    def create 
        @reply = Reply.new(replies_params)
        @reply.user_id = current_user.id
        @reply.comment_id = params[:comment_id]
        if @reply.save
            redirect_to post_path(@post)
        else 
            render :new
        end
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
