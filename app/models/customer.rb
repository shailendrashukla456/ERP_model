class Customer < ApplicationRecord
    has_many :sallers

    validates :name, presence: true
    validates :address, presence: true
    validates :company, presence: true
    validates :phone_number, presence: true
end
