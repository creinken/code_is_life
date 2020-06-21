class AddGithubIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :github_id, :string
  end
end
