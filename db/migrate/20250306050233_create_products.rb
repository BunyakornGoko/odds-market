class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :stock_quantity, null: false, default: 0
      t.references :seller, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.timestamps
    end
  end
end