class AddLocationToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :lat, :decimal, { precision: 10, scale: 6 }
    add_column :contracts, :lng, :decimal, { precision: 10, scale: 6 }
  end
end
