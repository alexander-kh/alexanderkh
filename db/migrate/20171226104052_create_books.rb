class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :link
      t.integer :year
      t.string :publisher
      t.string :isbn
      t.integer :pages

      t.timestamps
    end
  end
end
