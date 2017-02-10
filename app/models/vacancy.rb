class Vacancy < ActiveRecord::Base
  has_many :recruiter_vacancies
  has_many :recruiters, through: :recruiter_vacancies
  has_many :agencies, through: :recruiters
  has_one :request

  validates :title, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :salary, presence: true
end
