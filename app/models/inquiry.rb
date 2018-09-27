class Inquiry < ApplicationRecord
  belongs_to :house
  belongs_to :user

  validates :subject, presence: true, allow_blank: false, length: { maximum: 40 }
  validates :message, presence: true, allow_blank: false, length: { maximum: 250 }
end
