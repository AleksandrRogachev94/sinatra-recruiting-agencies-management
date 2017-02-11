class AddVacancyNameToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :vacancy_title, :string
  end
end
