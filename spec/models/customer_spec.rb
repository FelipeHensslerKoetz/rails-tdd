# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Creates a Customer' do
    customer = create(:customer)

    expect(customer.full_name).to eq('Sr. Felipe')
  end
end
