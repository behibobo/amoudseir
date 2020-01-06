class AddServiceDayToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :service_day, :integer, limit: 1
  end
end
