class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false  # Remove :unique option
      t.string :role, default: "customer"

      t.timestamps
    end

    # Add a unique index for the email column
    add_index :users, :email, unique: true
  end
end