# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: [:client] do
    name { Faker::Name.name }
    # email { Faker::Internet.email }
    sequence(:email) { |n| "my_email-#{n}@mail.com" }

    transient do
      upcased { false }
    end

    trait :female do
      gender { 'F' }
    end

    trait :male do
      gender { 'M' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_male_vip, traits: %i[male vip]
    factory :customer_female_vip, traits: %i[female vip]
    factory :customer_male_default, traits: %i[male default]
    factory :customer_female_default, traits: %i[female default]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
