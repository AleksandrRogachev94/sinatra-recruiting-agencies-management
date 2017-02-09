class CreateRecruiterVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :recruiter_vacancies do |t|
      t.integer :recruiter_id
      t.integer :vacancy_id
    end
  end
end
