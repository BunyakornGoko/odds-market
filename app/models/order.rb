class Order < ApplicationRecord
    belongs_to :customer, class_name: 'User', foreign_key: :customer_id
    has_many :order_items
    has_many :products, through: :order_items
    has_one :payment
    validates :total_amount, :status, presence: true
  end