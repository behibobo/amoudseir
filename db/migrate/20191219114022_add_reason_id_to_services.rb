class AddReasonIdToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :reason_id, :integer, limit: 2
  end
end
