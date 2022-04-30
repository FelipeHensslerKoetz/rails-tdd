# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it '/customers' do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it 'JSON Schema' do 
      create(:customer, id: 1, name: 'Felipe', email: 'felipe@gmail.com')

      get customer_path(1), params: { format: :json } 

      expect(response).to match_response_schema('customer')
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

    it '/customers/:id' do
      create(:customer, id: 1, name: 'Felipe', email: 'felipe@gmail.com')

      get customer_path(1), params: { format: :json }

      response_body = JSON.parse(response.body)

      expect(response_body['id']).to be_kind_of Integer
      expect(response_body['name']).to be_kind_of String
      expect(response_body['email']).to be_kind_of String
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

    it 'delete - JSON' do
      create(:customer)

      customer_params = Customer.first

      headers = { 'accept' => 'application/json' }

      delete "/customers/#{customer_params.id}.json", headers: headers

      expect(response).to have_http_status(204)
      expect(Customer.count).to be_zero
    end
  end
end
