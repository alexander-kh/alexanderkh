class AddPermalinkToWriting < ActiveRecord::Migration[5.1]
  def change
    add_column :writings, :permalink, :string
    add_index :writings, :permalink
  end
end
