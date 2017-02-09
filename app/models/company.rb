class Company < ActiveRecord::Base
  has_many :vacancies
  has_many :agencies, through: :vacancies

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
