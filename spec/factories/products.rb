# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    description { Faker::Commerce.product_name }
    price { Faker::Commerce.product_name }
    category
  end
end
