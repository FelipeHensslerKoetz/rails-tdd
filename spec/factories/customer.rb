# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: [:client] do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    transient do
      upcased { false }
    end

    trait :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
