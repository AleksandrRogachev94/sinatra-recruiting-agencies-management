class Request < ActiveRecord::Base
  belongs_to :recruiter
  belongs_to :vacancy

  validates :status, presence: true
end
