class CreateElevators < ActiveRecord::Migration[5.1]
  def change
    create_table :elevators do |t|
      t.references :contract, foreign_key: true
      t.string :serial_number, null: true
      t.integer :elevator_type, limit: 1
      t.integer :usage, limit: 1
      t.integer :capacity, limit: 1
      t.integer :floors, limit: 1
      t.integer :stops, limit: 1
      t.integer :swing, limit: 1
      t.integer :automatic, limit: 1
      t.string :door_type, null: true
      t.string :door_name, null: true
      t.integer :engine_room, limit: 1, null: true
      t.integer :suspension_type, limit: 1, null: true
      t.integer :engine_type, limit: 1, null: true
      t.string :engine, null: true
      t.float :power, null: true
      t.integer :panel_type, limit: 1, null: true
      t.string :panel_name,  null: true
      t.string :drive, null: true
      t.integer :feedback, limit: 1, null: true
      t.integer :car_communication, limit: 1, null: true
      t.integer :speed, limit: 1
      t.integer :emergency_system, limit: 1
      t.references :insurance, foreign_key: true
      t.string :insurance_finish_date, null: true
      t.string :insurance_date, null: true
      t.references :standard, foreign_key: true
      t.string :standard_finish_date, null: true
      t.integer :standard_type, limit: 1
      t.timestamps
    end
  end
end
