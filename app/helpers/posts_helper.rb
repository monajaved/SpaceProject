module PostsHelper
    def user_allowed
        current_user == @comment.user
    end
end
