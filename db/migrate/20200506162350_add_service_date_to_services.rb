class AddServiceDateToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :service_date, :date
  end
end
