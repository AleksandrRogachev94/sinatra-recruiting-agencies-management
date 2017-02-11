class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :recruiter_id
      t.integer :agency_id
      t.integer :vacancy_id
      t.text :description
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end
