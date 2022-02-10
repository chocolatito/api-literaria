class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.datetime :loan_date, null: false
      t.datetime :expiration_date, null: false
      t.datetime :return_date
      t.references :user, null: false, foreign_key: true
      t.references :book_copy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
