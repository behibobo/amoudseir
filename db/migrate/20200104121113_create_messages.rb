class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.references :to, references: :users, foreign_key: { to_table: :users}
      t.integer :message_type
      t.timestamps
    end
  end
end
