# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it '/customers' do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it '/customers.json' do
      create(:customer, id: 1, name: 'Felipe', email: 'felipe@gmail.com')

      get customers_path, params: { format: :json }

      expect(response.body).to include_json([
                                              id: 1,
                                              name: 'Felipe',
                                              email: 'felipe@gmail.com'
                                            ])
    end

    it '/customers/:id' do
      create(:customer, id: 1, name: 'Felipe', email: 'felipe@gmail.com')

      get customer_path(1), params: { format: :json }

      expect(response.body).to include_json(id: 1,
                                            name: (be_kind_of String),
                                            email: (be_kind_of String))
    end

    it 'create - JSON' do
      headers = { 'accept' => 'application/json' }

      customer_params = attributes_for(:customer)

      post '/customers.json', params: { customer: customer_params }, headers: headers

      expect(response.body).to include_json(id: (be_kind_of Integer),
                                            name: customer_params.fetch(:name),
                                            email: customer_params[:email])
    end

    it 'update - JSON' do
      create(:customer)

      customer_params = Customer.first

      headers = { 'accept' => 'application/json' }

      patch "/customers/#{customer_params.id}.json", params: { customer: { email: 'new_email@gmail.com' } },
                                                     headers: headers

      expect(response.body).to include_json(id: (be_kind_of Integer),
                                            name: (be_kind_of String),
                                            email: 'new_email@gmail.com')
    end
  end
end
