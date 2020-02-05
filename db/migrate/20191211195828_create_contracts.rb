class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.references :user, references: :users, foreign_key: { to_table: :users}
      t.references :customer, references: :users, foreign_key: { to_table: :users}
      t.string :building_number, null: true
      t.string :contract_number, null: true
      t.string :description, null: true
      t.date :start_date, null: true
      t.date :finish_date, null: true
      t.integer :payment_type, limit: 1, null: true
      t.integer :total_price, limit: 8, null: true
      t.string :address, null: true
      t.integer :service_day, limit: 1, null: true
      t.integer :stops, limit: 1, null: true


      t.timestamps
    end
  end
end
