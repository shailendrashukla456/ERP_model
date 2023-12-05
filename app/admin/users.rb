ActiveAdmin.register User do

  permit_params :name, :address, :company, :phone_number
  
  actions :index, :edit, :update, :create, :destroy
  

end
