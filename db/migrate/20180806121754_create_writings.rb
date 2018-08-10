class CreateWritings < ActiveRecord::Migration[5.1]
  def change
    create_table :writings do |t|
      t.string :title
      t.string :content
      t.integer :status

      t.timestamps
    end
  end
end
