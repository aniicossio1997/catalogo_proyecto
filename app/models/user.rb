# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  #--Relations
  belongs_to :profile
  has_many :buys
  #--Scope
  scope :clients, -> { where(profile: Profile.find_by(kind: 'client')) }
  scope :admins, -> { where(profile: Profile.find_by(kind: 'admin')) }

  def set_default_password
    self.password = username
  end

  def set_profile_admin
    self.profile = Profile.find_by(kind: 'admin')
  end

  def set_profile_client
    self.profile = Profile.find_by(kind: 'client')
  end

  def before_destroy
    byebug
    return if buys.count <= 0

    errors.add(:buys, 'No se puede eliminar clientes con compras ') # Usar i18n
  end
end
