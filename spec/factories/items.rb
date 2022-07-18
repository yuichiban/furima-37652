FactoryBot.define do
  factory :item do
    item_name              {'置き物'}
    price                  {300}
    item_text              {'山田'}
    category_id            {2}
    product_condition_id   {2}
    delivery_burden_id     {2}
    prefecture_id          {2}
    days_to_ship_id        {2}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end