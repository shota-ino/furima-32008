FactoryBot.define do
  factory :order_destination do
    post_code           { '123-4567' }
    prefecture_code_id  { 3 }
    city                { '札幌市' }
    house_number        { '1-1' }
    building_name       { '札幌ハイツ' }
    phone_number        { '09012345678' }
    token               {'tok_f11111ac11e1a1111a11b1cfa1a1'}
  end
end