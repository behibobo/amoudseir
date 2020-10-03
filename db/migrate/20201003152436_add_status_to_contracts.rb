class AddStatusToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :status, :integer, default: 0
  end
end
