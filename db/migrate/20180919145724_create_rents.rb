class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|

      #t.integer :user_id, null: false
      #t.integer :book_id, null: false
      t.datetime :initial_date, null: false
      t.datetime :final_date, null: false

      t.references :user, index: true, null: false
      t.references :book, index: true, null: false
      t.timestamps
    end
  end
end
