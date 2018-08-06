class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :text
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
  end
end
