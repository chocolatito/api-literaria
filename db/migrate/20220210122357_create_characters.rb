class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.boolean :is_human, null: false

      t.timestamps
    end
  end
end
