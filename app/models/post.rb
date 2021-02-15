class Post < ApplicationRecord
    has_many :replies, through: :comments
    has_many :users, through: :comments
    has_many :comments

    def self.order
        where posts.order("updated_at DESC")
    end

end
