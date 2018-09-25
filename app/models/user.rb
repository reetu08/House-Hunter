class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy

  @@preferred_contact_types = [:text, :call, :email]

  def self.preferred_contact_types
    @@preferred_contact_types
  end

  def admin?
    map_available_roles.include?('ADMIN')
  end

  def househunter?
    map_available_roles.include?('HOUSE-HUNTER')
  end

  def realtor?
    map_available_roles.include?('REALTOR')

  end

  def map_available_roles
    roles.each.map &:name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
