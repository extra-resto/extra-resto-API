class Job < ApplicationRecord
  belongs_to :event
  has_many :businesses, through: :event
  has_many :candidatures

end
