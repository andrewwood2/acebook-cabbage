require "rails_helper"

# RSpec.feature "New Users", type: :feature do
#   scenario "user sign up" do
#     visit "/users/sign_up"
#     fill_in :user_name, with: "Bob"
#     fill_in :user_email, with: "Bob@bob.com"
#     fill_in :user_password, with: "123456"
#     fill_in :user_password_confirmation, with: "123456"
#     click_button "Sign up"
#     expect(page).to have_content("Acebook")
#   end
# end

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/users' }
  let(:params) do
    {
        name: 'Bob',
        email: 'bob@bob.com',
        password: '123456',
        password_confirmation: '123456'
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      expect(response.body).to match_schema('user')
    end
  end

  context 'when user already exists' do
    before do
      post url, params: params
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      expect(json['errors'].first['title']).to eq('Bad Request')
    end
  end
end
