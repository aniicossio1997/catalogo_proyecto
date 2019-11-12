class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :validatable, password_length: 1..128
  devise :database_authenticatable, authentication_keys: [:username]
  def set_default_password
    self.password = username
  end
end
