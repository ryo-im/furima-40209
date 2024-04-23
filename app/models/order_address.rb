class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :street_address, :building, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :street_address
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building: building, phone_number: phone_number, order_id: order.id)
  end
end