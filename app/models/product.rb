class Product < ApplicationRecord
    belongs_to :seller, class_name: 'User', foreign_key: :seller_id
    has_many :order_items
    has_many :orders, through: :order_items
    validates :name, :price, :stock_quantity, presence: true
  end