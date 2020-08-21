class AddInsuranceTypeToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :insurance_type, :integer
  end
end
