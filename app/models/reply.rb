class Reply < ApplicationRecord
    belongs_to :user
    belongs_to :comment
    accepts_nested_attributes_for :user
end
