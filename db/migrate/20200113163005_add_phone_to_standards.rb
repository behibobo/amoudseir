class AddPhoneToStandards < ActiveRecord::Migration[5.1]
  def change
    add_column :standards, :phone, :string
  end
end
