class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :businesses
  has_many :events, through: :businesses
  enum role: [:candidate, :employer, :admin]

  has_one_attached :resume

  def resume_url
    if resume.attached?
      resume.blob.service_url
    end
  end
end
