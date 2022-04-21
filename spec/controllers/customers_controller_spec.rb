# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'returns 200 status code' do
    get :index

    expect(response).to have_http_status(200)
  end
end
