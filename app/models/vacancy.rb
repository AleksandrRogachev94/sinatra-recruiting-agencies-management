class Vacancy < ActiveRecord::Base
  has_many :recruiter_vacancies
  has_many :recruiters, through: :recruiter_vacancies
  belongs_to :company
  has_many :agencies, through: :recruiters

  validates :title, presence: true
  validates :description, presence: true
  validates :salary, presence: true
end
