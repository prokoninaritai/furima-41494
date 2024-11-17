FactoryBot.define do
  factory :order_shipping_address do
    post_code          {'123-4567'}
    prefecture_id      { 2 }
    city               {'函館市'}
    address            {'本町1-2'}
    building           {'本町ビル'}
    mobile             {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
