require 'rails_helper'

RSpec.describe "Customers", type: :request do
  
 
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/customers#index'
      expect(response).to have_http_status(:ok)
    end

  end

  describe 'GET #show' do
    it 'returns a successful response' do
    data = Customer.create(
     {
      "name" => "shard",
      "address" => "inde",
      "company" => "xz",
      "phone_number" => "909898988"
      }
    )
    get '/customers#show', params: { id: data.id }
    expect(response).to have_http_status(:ok)
    end
  end



  describe 'POST #create' do
  # let(:params) do
  #   {
  #     customer: FactoryBot.attributes_for(:customers)
  #   }
  # end 


  let(:params) do{ "customer": {
        "name" => "sharad",
        "address" => "indore",
        "company" => "xyz",
        "phone_number" => "9909898988"
      }
      }
    end

    let(:invalid_params) do{ "customer": {
        "name" => "",
        "address" => "",
        "company" => "",
        "phone_number" => ""
      }
      }
    end

      it 'creates Customer' do
        post '/customers#create', params: params

        expect(response).to have_http_status(200)
      end

      it 'returns a 400 Bad Request for invalid parameters' do
        post '/customers#create', params: invalid_params
    
        expect(response).to have_http_status(422)
      end
  end


  describe 'PUT #update' do
    it 'updates the customer attributes' do
      # Create a customer
      customer = Customer.create(name: 'John Doe', address: '123 Main St', company: 'ABC Corp', phone_number: '555-1234')

      # Define the new attributes you want to update
      new_attributes = { name: 'Updated Name' }

      # Send a PUT request to the update action
      put '/customers', params: { id: customer.id, customer: new_attributes }

      # Reload the customer object to get the latest attributes from the database
      customer.reload

      # Check if the attributes have been updated
      expect(customer.name).to eq('Updated Name')

      # Optionally, you can test the response status
      expect(response).to have_http_status(:ok)
    end
  end
end
