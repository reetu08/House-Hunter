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
  enum size: %i[0-50 51-200 201-500 501-1000 1000+]
  validates :found_year, presence: true,
                         numericality: {
                           only_integer: true,
                           greater_than_or_equal_to: 1000,
                           less_than_or_equal_to: Date.today.year
                         }
  enum revenue: [:'Below $1 Million', :'$1 to 10 Million', :'$10 to 100 Million', :'$Above $100 Million']
  validates :synopsis, presence: true

  def owned_by
    owning_realtor = realtors.each.select { |realtor| realtor.company_id == id }
    index = 0
    names = []
    owning_realtor.length.times do
      names << owning_realtor[index].user.name
      index += 1
    end
    return names.join(', ')
  end

      # owning_realtor = realtors.each.select { |realtor| realtor.is_owner }
      #
      # if owning_realtor.empty?
      #   #return 'No Owner Yet'
      #   return owning_realtor.size
      # else
      #   owning_realtor = owning_realtor[0]
      #   owning_user = User.find_by_id owning_realtor.user_id
      #   owning_user.name
      # end

end
