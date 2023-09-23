class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_area
  belongs_to :ship_day
  belongs_to :ship_method
  belongs_to :ship_charge
  belongs_to :user

  validates :item_name, :description, :price, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_method_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
end