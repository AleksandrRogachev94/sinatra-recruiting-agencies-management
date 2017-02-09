class Recruiter < ActiveRecord::Base
  has_secure_password
  belongs_to :agency
  has_many :recruiter_vacancies
  has_many :vacancies, through: :recruiter_vacancies

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :speciality, presence: true

  def slug
    self.username.strip.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find { |obj| obj.slug == slug }
  end
end
