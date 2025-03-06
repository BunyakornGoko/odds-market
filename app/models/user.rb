class User < ApplicationRecord
    has_many :products, foreign_key: :seller_id
    has_many :orders, foreign_key: :customer_id
    validates :first_name, :last_name, :email, :role, presence: true
    validates :email, uniqueness: true
  end