class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :company_id
      t.timestamps null: false
    end
  end
end
