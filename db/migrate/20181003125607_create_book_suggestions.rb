class CreateBookSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :book_suggestions do |t|
      t.string :synopsis, null: true
      t.float :price, null: true
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :publisher, null: false
      t.string :year, null: false
      t.references :user, index: true, null: true

      t.timestamps
    end
  end
end
