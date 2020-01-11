class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.references :user, references: :users, foreign_key: { to_table: :users}
      t.references :customer, references: :users, foreign_key: { to_table: :users}
      t.string :title
      t.string :description
      t.date :start_date
      t.date :finish_date
      t.integer :total_price, limit: 8
      t.string :address
      t.references :insurance, foreign_key: true
      t.string :insurance_finish_date, null: true
      t.string :insurance_date, null: true
      t.references :standard, foreign_key: true
      t.string :standard_finish_date, null: true
      t.integer :swing
      t.integer :automatic
      t.integer :elevator_type, limit: 1
      t.integer :floors, limit: 1
      t.integer :stops, limit: 1
      t.integer :usage, limit: 1
      t.integer :capacity, limit: 1
      t.string :automatic_door_name, null: true
      t.string :serial_number, null: true
      t.integer :towing_wire, limit: 1, null: true
      t.integer :engine_room, limit: 1, null: true
      t.integer :panel_type, limit: 1, null: true
      t.string :panel_name,  null: true
      t.string :drive,  null: true
      t.integer :feedback, limit: 1, null: true
      t.string :engine, null: true
      t.integer :engine_type, limit: 1, null: true
      t.float :power, null: true
      t.integer :car_communication, limit: 1, null: true
      t.timestamps
    end
  end
end
