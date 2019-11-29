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

  before_destroy :check_buys

  delegate :kind, to: :profile
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

    #errors.add(:username, :blank) #Usar i18n
    errors.add(:base, 'No se puede eliminar un cliente que tenga compras asociadas')
    throw(:abort)
  end
end
