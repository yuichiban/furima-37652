FactoryBot.define do
  factory :buyer_shopping do
    post_code                {'123-4567'}
    prefecture_id            {2}
    municipalities           {'横浜市緑区'}
    address                  {'青山1-1-1'}
    building_name            {'柳ビル103'}
    phone_number             {'09072300084'}
    token                    {"tok_abcdefghijk00000000000000000"}
  end
end

