class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :customer, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.decimal :total_amount, precision: 10, scale: 2, null: false
      t.string :status, null: false, default: "pending" # 'pending', 'paid', 'shipped', 'completed', 'cancelled'
      t.timestamps
    end
  end
end