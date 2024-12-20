class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :address, :building, :mobile, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :mobile, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      mobile: mobile,
      order_id: order.id
    )
  end
end
