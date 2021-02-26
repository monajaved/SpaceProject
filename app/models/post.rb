class Post < ApplicationRecord
    has_many :replies, through: :comments
    has_many :users, through: :comments
    has_many :comments

    def self.search_post(query)
        where('LOWER (title) LIKE ?', "%#{query.downcase }%")
    end

end
