class Employer < ApplicationRecord
  belongs_to :user
  has_many :businesses
end
