class Shopping < ApplicationRecord
  belongs_to :buyer

  # 数字3桁、ハイフン、数字4桁の並びのみ許可する
  # validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # 0以外の整数を許可する
  # validates :prefecture_id numericality: {other_than: 0, message: "can't be blank"}
end
