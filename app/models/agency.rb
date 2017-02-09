class Agency < ActiveRecord::Base
  has_secure_password
  has_many :recruiters
  has_many :vacancies, through: :recruiters
  has_many :companies, through: :vacancies

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
