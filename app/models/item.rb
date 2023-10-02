class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_area
  belongs_to :ship_day
  belongs_to :ship_charge
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
  end
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'Half-width number.' }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_charge_id, numericality: { other_than: 1, message: "can't be blank" }

  validate :image_presence

  private

  def image_presence
    errors.add(:image, 'must be attached') unless image.attached?
  end
end
