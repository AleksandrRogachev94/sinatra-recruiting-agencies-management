class Request < ActiveRecord::Base
  belongs_to :recruiter
  belongs_to :vacancy

  validates :status, presence: true

  def pending?
    self.status == "pending"
  end

  def confirmed?
    self.status == "confirmed"
  end

  def declined?
    self.status == "declined"
  end
end
