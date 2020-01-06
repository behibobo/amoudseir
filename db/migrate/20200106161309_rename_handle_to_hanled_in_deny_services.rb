class RenameHandleToHanledInDenyServices < ActiveRecord::Migration[5.1]
  def change
    rename_column :deny_services, :handle, :handled
  end
end
