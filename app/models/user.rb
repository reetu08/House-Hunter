class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  has_many :inquiry_reply, foreign_key: :realtor_id

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :phone, presence: true, length: { within: (9..10) }, numericality: { only_integer: true }

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

  def is_realtor_for_house?(house_id)
    realtors = Realtor.for_house(house_id)
    realtors.select{ |realtor| realtor.user_id == id }.size == 1
  end

  def map_available_roles
    roles.each.map &:name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
