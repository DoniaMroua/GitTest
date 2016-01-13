class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :firstname
      t.string :secondname
      t.integer :age

      t.timestamps null: false
    end
  end
end
