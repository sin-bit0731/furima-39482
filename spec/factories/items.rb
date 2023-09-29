FactoryBot.define do
  factory :item do
    item_name          { 'あんかけチャーハンの具セット' }
    description        { '3食分のセット販売になります' }
    category_id        { 2 }
    condition_id       { 2 }
    ship_charge_id     { 2 }
    ship_area_id       { 40 }
    ship_day_id        { 2 }
    price              { 1500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/PXL_20230701_042907702.jpg'), filename: 'PXL_20230701_042907702.jpg')
    end
  end
end
