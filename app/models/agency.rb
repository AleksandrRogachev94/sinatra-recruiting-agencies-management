class Agency < ActiveRecord::Base
  has_secure_password
  has_many :recruiters
  has_many :vacancies, through: :recruiters
  has_many :requests, through: :recruiters

  validates :username, :email, presence: true, uniqueness: true
end
