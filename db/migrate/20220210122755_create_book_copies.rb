class CreateBookCopies < ActiveRecord::Migration[6.1]
  def change
    create_table :book_copies do |t|
      t.string :isnb, null: false
      t.string :state, null: false
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
