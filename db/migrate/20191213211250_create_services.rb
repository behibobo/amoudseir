class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.references :contract, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :request_type, limit: 1
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
