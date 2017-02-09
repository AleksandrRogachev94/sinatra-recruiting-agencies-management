class CreateRecruiters < ActiveRecord::Migration[5.0]
  def change
    create_table :recruiters do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.index :name, unique: true
      t.index :email, unique: true
      t.string :password_digest, null: false
      t.string :phone
      t.integer :agency_id
      t.timestamps null: false
    end
  end
end
