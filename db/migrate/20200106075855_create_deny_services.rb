class CreateDenyServices < ActiveRecord::Migration[5.1]
  def change
    create_table :deny_services do |t|
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true
      t.references :deny_reason, foreign_key: true

      t.timestamps
    end
  end
end
