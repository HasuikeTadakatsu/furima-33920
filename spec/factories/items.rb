FactoryBot.define do
  factory :item do
    name                    {Faker::Name.initials}
    description             {Faker::Lorem.sentence}
    category_id             {'2'}
    status_id               {'3'}
    shipping_fee_burden_id  {'2'}
    prefecture_id           {'3'}
    days_to_ship_id         {'2'}
    selling_price           {'1000'}  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
