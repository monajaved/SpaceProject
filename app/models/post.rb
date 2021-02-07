class Post < ApplicationRecord
    has_many :replies, through: :comments
    has_many :users, through: :comments
    has_many :comments

end
