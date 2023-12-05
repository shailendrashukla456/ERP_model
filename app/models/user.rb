class User < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["address", "company", "created_at", "id", "id_value", "name", "phone_number", "updated_at"]
      end
end
