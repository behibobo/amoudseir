class CreateServiceParts < ActiveRecord::Migration[5.1]
  def change
    create_table :service_parts do |t|
      t.references :service, foreign_key: true
      t.string :name
      t.integer :qty, limit: 2
      t.integer :price, limit: 8

      t.timestamps
    end
  end
end
