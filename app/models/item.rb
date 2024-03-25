class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_until_shipping
  
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { message: "can't be blank" }
  validates :condition_id, numericality: { message: "can't be blank" }
  validates :delivery_charge_id, numericality: { message: "can't be blank" }
  validates :prefecture_id, numericality: { message: "can't be blank" }
  validates :days_until_shipping_id, numericality: { message: "can't be blank" }
  validates :image, presence: true

  with_options presence: true, format: {with: /\A[0-9]+\z/ } do
    validates :price, numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "can't be blank" }
  end
end