class CreateRecruiters < ActiveRecord::Migration[5.0]
  def change
    create_table :recruiters do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.index :username, unique: true
      t.index :email, unique: true
      t.string :password_digest, null: false
      t.string :phone
      t.string :speciality, null: false
      t.integer :agency_id
      t.timestamps null: false
    end
  end
end
