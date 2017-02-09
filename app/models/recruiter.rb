class Recruiter < ActiveRecord::Base
  has_secure_password
  belongs_to :agency
  has_many :recruiter_vacancies
  has_many :vacancies, through: :recruiter_vacancies

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
