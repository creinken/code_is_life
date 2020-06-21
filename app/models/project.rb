class Project < ApplicationRecord
    belongs_to :user
    scope :imported,    -> { where(imported: true) }

end
