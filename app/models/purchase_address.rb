class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :ship_area_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :ship_area_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    CustomerAddress.create(post_code: post_code, ship_area_id: ship_area_id, city: city, block: block, building: building,
                           phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
