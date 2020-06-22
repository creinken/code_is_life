class ChangeGithubIdToBeIntegerInProjects < ActiveRecord::Migration[6.0]
  def change
      change_column :projects, :github_id, :integer
  end
end
