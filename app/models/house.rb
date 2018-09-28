class House < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :potential_buyers

  has_one_attached :image_path
end
