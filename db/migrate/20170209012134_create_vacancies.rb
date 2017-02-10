class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :company, null: false
      t.string :company_phone
      t.integer :salary, null: false
      t.timestamps null: false
    end
  end
end
