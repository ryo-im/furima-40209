FactoryBot.define do
  factory :item do
    name                   { Faker::Name.initials(number: 2) }
    description            { 'test' }
    category               { Category.all.sample }
    condition              { Condition.all.sample }
    delivery_charge        { DeliveryCharge.all.sample }
    prefecture             { Prefecture.all.sample }
    days_until_shipping    { DaysUntilShipping.all.sample }
    price                  { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end