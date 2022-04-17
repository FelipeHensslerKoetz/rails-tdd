# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  it 'Creates a Customer' do
    customer = customers(:felipe)

    expect(customer.full_name).to eq('Sr. Felipe')
  end
end
