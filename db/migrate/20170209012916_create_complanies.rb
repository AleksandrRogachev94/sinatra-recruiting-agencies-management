class CreateComplanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.index :name, unique: true
      t.index :email, unique: true
      t.string :address
      t.timestamps null: false
    end
  end
end
