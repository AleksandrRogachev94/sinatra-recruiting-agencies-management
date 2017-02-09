class Company < ActiveRecord::Base
  has_many :vacancies
  has_many :recruiters, through: :vacancies
  has_many :agencies, through: :recruiters

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def slug
    self.username.strip.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find { |obj| obj.slug == slug }
  end
end
