class Company < ApplicationRecord
  has_many :realtors
  has_many :houses

  validates :name, presence: true
  validates :website, presence: true,
                      format: {
                        with: /\A^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/,
                        message: 'Invalid Format'
                      }
  validates :addr, presence: true,
                   format: {
                     with: /\A[a-zA-Z ]+, [A-Z]{1,4}\Z/,
                     message: 'Headquater\'s location required, eg. Raleigh, NC'
                   }
  validates :found_year, presence: true,
                         numericality: {
                           only_integer: true,
                           greater_than_or_equal_to: 1800,
                           less_than_or_equal_to: Date.today.year
                         }
  validates :revenue, numericality: { only_integer: true }
  validates :synopsis, presence: true

  def owned_by
    owning_realtor = realtors.each.select { |realtor| realtor.is_owner == true }
    if (owning_realtor.size == 0)
      return 'No Owner Yet'
    end
    owning_realtor = owning_realtor[0]
    owning_user = User.find_by_id owning_realtor.user_id
    owning_user.name
  end

  def size
    realtors.size
  end

end
