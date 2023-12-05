class SellersController < ApplicationController
    def index
        @sellers = Saller.all
        render json: @sellers
      end
  
      # GET /api/customers/1
      def show
        render json: @seller
      end
  
      # POST /api/customers
      def create
        @seller = Seller.new(seller_params)
  
        if @seller.save
          render json: @seller, status: :created, location: api_customer_url(@seller)
        else
          render json: @seller.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/customers/1
      def update
        if @seller.update(seller_params)
          render json: @seller
        else
          render json: @seller.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/customers/1
      def destroy
        @customer.destroy
      end
  
      private
  
      def set_seller
        @seller = Seller.find(params[:id])
      end
  
      def seller_params
        params.require(:customer).permit(:name, :address, :company, :phone_number, :customer_id)
      end
end
