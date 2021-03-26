class Event < ApplicationRecord
  belongs_to :business
  has_many :jobs, dependent: :destroy

end
