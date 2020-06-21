class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.string :description
      t.integer :user_id
      t.string :language

      t.timestamps
    end
  end
end
