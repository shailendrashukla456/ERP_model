class Saller < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :address, presence: true
  validates :company, presence: true
  validates :phone_number, presence: true
  validates :customer_id, presence: true

end
