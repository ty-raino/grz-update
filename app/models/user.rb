class User < ApplicationRecord
  has_many :reviews
  has_many :games, through: :reviews 

  validates :username, uniqueness: true, if: :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
         def self.from_google(uid:, email:, full_name:, avatar_url:)
          byebug
          if user = User.find_by(email: email)
            user.update(uid: uid, full_name: full_name, avatar_url: avatar_url) unless user.uid.present?
            user
          else
            User.create(
              email: email,
              uid: uid,
              full_name: full_name,
              avatar_url: avatar_url,
              password: SecureRandom.hex
            )
          end
        end

        def display_name
        end
end