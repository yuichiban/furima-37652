FactoryBot.define do
  factory :item do
    item_name              {'置き物'}
    price                  {300}
    item_text              {'山田'}
    category_id            {1}
    product_condition_id   {1}
    delivery_burden_id     {1}
    prefecture_id          {1}
    days_to_ship_id        {1}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end