require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has an order (association with factory)' do 
    order = create(:order)
    puts order.customer
  end

  it 'has an order (manual association)' do 
    customer = create(:customer)
    order = create(:order, customer: customer)
    puts order.customer
  end

  it 'has three orders' do 
    orders = create_list(:order, 3)
    expect(orders.size).to eq(3)
  end

  it 'creates a pair' do 
    orders = create_pair(:order)
    expect(orders.size).to eq(2)
  end

  it 'has many orders' do 
    customer = create(:customer, :with_orders)
    expect(customer.orders.size).to eq(3)
  end
end
