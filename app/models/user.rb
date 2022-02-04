class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :jogging_records, dependent: :destroy
  validates_presence_of :email, :password

  enum role: %i[user moderator admin]
end
