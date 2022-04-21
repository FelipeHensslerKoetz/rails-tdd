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
    it '#show' do
      member = create(:member)
      sign_in member
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders :index template' do
      member = create(:member)
      sign_in member
      get :index
      expect(response).to render_template(:index)
    end
  end
end
