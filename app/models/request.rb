class Request < ActiveRecord::Base
  belongs_to :recruiter
  belongs_to :vacancy
end
