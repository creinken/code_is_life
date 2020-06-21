class Project < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :commenters, through: :comments
    scope :imported,    -> { where(imported: true) }
    scope :mine,        -> (user) { Project.where( user_id: user.id ) }

end
