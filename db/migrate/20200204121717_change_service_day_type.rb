class ChangeServiceDayType < ActiveRecord::Migration[5.1]
  def change
    change_column :contracts, :service_day, :string
  end
end
