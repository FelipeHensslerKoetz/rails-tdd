# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it '#full name (override random values)' do
    customer = create(:customer, name: 'Felipe', email: 'felipe@gmail.com')
    expect(customer.name).to eq('Felipe')
    expect(customer.full_name).to eq('Sr. Felipe')
    expect(customer.email).to eq('felipe@gmail.com')
  end

  it '#full_name (with factory aliases)' do
    client = create(:client)
    expect(client.full_name).to start_with('Sr. ')
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
