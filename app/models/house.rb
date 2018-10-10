class House < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :potential_buyers

  validates :location, presence: true
  validates :area, presence: true, numericality: true
  validates :year_built, presence: true, numericality: {only_integer:  true}
  validates :style, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :price, presence: true, numericality: true
  validates :floors, presence: true, numericality: {only_integer:  true}
  validates :has_basement, presence: true, inclusion: {in: [true, false]}
  validates :owner, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: "name format is incorrect" }
  validates :phone, presence: true, length: {is: 10, message: "no dashes"}, numericality: {only_integer: true, message: "only numbers" }
  validates :email, presence: true, formate: {with: Devise::email_regexp, message: "email format is incorrect" }

  has_one_attached :image_path
end
