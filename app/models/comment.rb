class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_many :replies
    validates :text, presence: true
end
