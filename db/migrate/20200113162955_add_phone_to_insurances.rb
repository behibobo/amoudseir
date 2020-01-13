class AddPhoneToInsurances < ActiveRecord::Migration[5.1]
  def change
    add_column :insurances, :phone, :string
  end
end
