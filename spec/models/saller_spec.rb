require 'rails_helper'

RSpec.describe Saller, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:phone_number) }
  it { should belong_to(:customer) }
end
