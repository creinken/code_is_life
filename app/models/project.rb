class Project < ApplicationRecord
    belongs_to :user
    has_many :comments
    scope :imported,    -> { where(imported: true) }
    scope :mine,        -> { where(user_id: self.id) }

end
