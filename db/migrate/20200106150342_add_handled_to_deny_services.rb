class AddHandledToDenyServices < ActiveRecord::Migration[5.1]
  def change
    add_column :deny_services, :handle, :boolean, default: false
  end
end
