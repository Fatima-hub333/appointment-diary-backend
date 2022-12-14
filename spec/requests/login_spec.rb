require 'rails_helper'

RSpec.describe 'users/sign_in', type: :request do
  context 'sign_in' do
    before(:each) do
      post user_session_path, params: { email: 'john123@gmail.com', password: 'test123' }
    end
    it 'Responds with ok status' do
      puts response
      expect(response).to have_http_status(:ok)
    end

    it 'The response body has success within ' do
      puts JSON.parse(response.body)['data']
      expect(response.body).to include('Success')
    end
    it 'Responds data has the email of the user signed in' do
      data = JSON.parse(response.body)['data']
      expect(data['email']).to eq('john123@gmail.com')
    end
  end
end
