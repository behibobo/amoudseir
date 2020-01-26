class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.references :user, references: :users, foreign_key: { to_table: :users}
      t.references :customer, references: :users, foreign_key: { to_table: :users}
      t.string :building_number
      t.string :contract_number
      t.string :description
      t.date :start_date
      t.date :finish_date
      t.integer :payment_type, limit: 1
      t.integer :total_price, limit: 8
      t.string :address
      t.integer :service_day, limit: 1
      

      t.timestamps
    end
  end
end
