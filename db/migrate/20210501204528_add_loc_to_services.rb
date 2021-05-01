class AddLocToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :lat, :decimal, { precision: 10, scale: 6 }
    add_column :services, :lng, :decimal, { precision: 10, scale: 6 }
  end
end
