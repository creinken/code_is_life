class Commenter < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :projects, through: :comments
end
