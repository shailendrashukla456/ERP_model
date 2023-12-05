class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :company
      t.string :phone_number

      t.timestamps
    end
  end
end
