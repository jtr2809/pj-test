require 'rails_helper'

RSpec.describe 'V1::Orders', type: :request do
  describe 'GET orders#index' do
    it 'should get index' do
      get '/v1/orders'
      expect(response).to have_http_status(200)
    end
  end
end
