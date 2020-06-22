class ChangeCommentsUserIdToCommenterId < ActiveRecord::Migration[6.0]
  def change
      rename_column :comments, :user_id, :commenter_id
  end
end
