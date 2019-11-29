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

<<<<<<< HEAD
  before_destroy :check_buys

  delegate :kind, to: :profile
=======
>>>>>>> f24c7b036a3cd2bef1f7456e1ed1678c1db243f8
  def set_default_password
    self.password = username
  end

  def set_profile_admin
    self.profile = Profile.find_by(kind: 'admin')
  end

  def set_profile_client
    self.profile = Profile.find_by(kind: 'client')
  end

  def check_buys
    return if buys.count.zero?

<<<<<<< HEAD
    #errors.add(:username, :blank) #Usar i18n
    errors.add(:base, 'No se puede eliminar un cliente que tenga compras asociadas')
    throw(:abort)
=======
    errors.add(:buys, 'No se puede eliminar clientes con compras ') # Usar i18n
>>>>>>> f24c7b036a3cd2bef1f7456e1ed1678c1db243f8
  end
end
