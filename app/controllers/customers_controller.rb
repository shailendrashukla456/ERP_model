class CustomersController < ApplicationController
   
    # GET /api/customers
    def index
      @customers = Customer.all
      render json: @customers
    end

    # GET /api/customers/1
    def show
      @customer = Customer.find(params[:id])
      render json: @customer
    end

    # POST /api/customers
    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        render json: @customer, status:200
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/customers/1
    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        render json: @customer, status: :ok
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/customers/1
    def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy
    end

    private

    def customer_params
      params.require(:customer).permit(:name, :address, :company, :phone_number)
    end
end
