class CreateCustomerTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_transactions do |t|
      t.references :customer, references: :users, foreign_key: { to_table: :users}
      t.integer :amount, limit: 8
      t.integer :dept, limit: 8
      t.integer :payment_type
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
