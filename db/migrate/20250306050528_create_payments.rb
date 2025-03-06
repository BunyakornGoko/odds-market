class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.string :status, null: false, default: "pending" # 'pending', 'paid', 'failed'
      t.timestamps
    end
  end
end