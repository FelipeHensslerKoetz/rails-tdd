# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it '#full name (override random values)' do
    customer = create(:customer_male_default, name: 'Felipe', email: 'felipe@gmail.com')
    expect(customer.name).to eq('Felipe')
    expect(customer.full_name).to eq('Sr. Felipe')
    expect(customer.email).to eq('felipe@gmail.com')
    expect(customer.vip).to be_falsey
    expect(customer.days_to_pay).to eq(15)
  end

  it '#full_name (with factory aliases)' do
    client = create(:client)
    expect(client.full_name).to start_with('Sr. ')
  end

  it 'attributes_for' do
    attrs = attributes_for(:customer)
    puts attrs
  end

  it 'transient attribute' do
    customer = create(:customer_male_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'nested factories' do 
    attrs = attributes_for(:customer_male_default)
    expect(attrs[:gender]).to eq('M')
    puts attrs
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
