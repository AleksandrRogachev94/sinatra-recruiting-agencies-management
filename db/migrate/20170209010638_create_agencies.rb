class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.index :name, unique: true
      t.index :email, unique: true
      t.string :address
      t.string :password_digest, null: false
      t.timestamps null: false
    end
  end
end
