class Comment < ApplicationRecord
    belongs_to :commenter
    belongs_to :project
end
