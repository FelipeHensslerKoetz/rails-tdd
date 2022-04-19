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
end
