# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request, api: true do

  before { create_list(:user, 3, :with_products) }

  describe 'GET #index' do
    before { get api_v1_users_path }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to match_response_schema(:users, strict: true) }
  end
end