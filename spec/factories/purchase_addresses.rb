FactoryBot.define do
  factory :purchase_address do
    post_code    { '123-4567' }
    ship_area_id { '2' }
    city         { '東京都' }
    block        { '1-1' }
    building     { '東京ハイツ' }
    phone_number { '09023456789' }
    token        { 'tok_abcdefghijk00000000000000000'}
  end
end
