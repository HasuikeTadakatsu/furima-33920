FactoryBot.define do
  factory :item_order do
    token         {'tok_abcdefghijklm000000000000000'}
    postal_code    {'123-4567'}
    prefecture_id  {3}
    municipality   {'鈴鹿市'}
    address        {'1-2-3'}
    building_name  {'建物'}
    phone_number   {'09011223333'} 
  end
end