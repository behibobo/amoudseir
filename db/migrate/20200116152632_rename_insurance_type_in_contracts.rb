class RenameInsuranceTypeInContracts < ActiveRecord::Migration[5.1]
  def change
    rename_column :contracts, :insurance_type, :standard_type
  end
end
