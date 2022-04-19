FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order n.#{n}" }
    customer # or association :customer, factory: :customer
  end
end
