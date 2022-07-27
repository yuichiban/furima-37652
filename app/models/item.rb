class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :product_condition

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  validates :item_name, :image, :item_text, presence: true

  validates :category_id, :product_condition_id, :delivery_burden_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end
