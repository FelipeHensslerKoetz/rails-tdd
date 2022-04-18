# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: [:client] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
