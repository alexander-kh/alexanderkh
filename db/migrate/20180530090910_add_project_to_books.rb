class AddProjectToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :project_repo, :string
  end
end
