# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request, api: true do

  before { create_list(:user, 3, :with_products) }

  describe 'GET #index' do
    before { get api_v1_users_path }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to match_response_schema(:users, strict: true) }
  end

  describe 'GET #show' do
    let(:user) { User.last }

    context 'success' do
      before { get api_v1_user_path(user) }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to match_response_schema(:user, strict: true) }
    end

    context 'failure' do
      before { get api_v1_user_path(id: '0') }

      it { expect(response).to have_http_status(:not_found) }
      it { expect(response.body).to match(/record not found/)}
    end
  end
end