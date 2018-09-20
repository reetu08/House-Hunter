class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy

  def admin?
    map_role_names.include?('ADMIN')
  end

  def househunter?
    map_role_names.include?('HOUSE-HUNTER')
  end

  def realtor?
    map_role_names.include?('REALTOR')

  end

  def map_role_names
    roles.each.map &:name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
