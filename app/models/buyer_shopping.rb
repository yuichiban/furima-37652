class BuyerShopping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :price, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  validates :municipalities, :address, :phone_number, presence: true

  validates :phone_number, format: {with:/\A0[0-9]{9,10}\z/, message: "is invalid"}

  validates :token, :user_id, :item_id, presence: true

  

  def save
    # 寄付情報を保存し、変数donationに代入する
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Shopping.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end