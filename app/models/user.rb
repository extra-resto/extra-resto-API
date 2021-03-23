class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :businesses
  has_many :events, through: :businesses

  has_many :candidatures

  enum role: [:candidate, :employer, :admin]
end
