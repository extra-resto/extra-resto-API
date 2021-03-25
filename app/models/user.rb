class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :businesses
  has_many :events, through: :businesses
  has_many :jobs, through: :events

  has_many :candidatures
  accepts_nested_attributes_for :jobs, allow_destroy: true

  
  enum role: [:candidate, :employer, :admin]

  has_one_attached :resume

  def resume_url
    if resume.attached?
      resume.blob.service_url
    end
  end
  
  # Mailer
  after_create :welcome_send
  
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
