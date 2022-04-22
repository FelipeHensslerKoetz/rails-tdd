# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a guest' do
    it '#index' do
      get :index

      expect(response).to have_http_status(200)
    end
  end

  describe 'as a logged member' do
    before do
      @member = create(:member)
      @customer = create(:customer)
      sign_in @member
    end

    it '#create' do
      customer_params = attributes_for(:customer)
      post :create, params: { customer: customer_params, format: :json }
      expect(response).to have_http_status(201)
    end

    it 'Flash Notice' do
      customer_params = attributes_for(:customer)
      post :create, params: { customer: customer_params, format: :html }

      expect(flash[:notice]).to eq('Customer was successfully created.')
    end

    it '#show' do
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it 'renders :show template' do
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end
end
