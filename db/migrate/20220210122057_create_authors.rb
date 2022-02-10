class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :names, null: false
      t.string :surnames, null: false
      t.date :birth, null: false
      t.date :death

      t.timestamps
    end
  end
end
