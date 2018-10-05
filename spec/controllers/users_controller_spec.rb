require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do

  # @request.env["devise.mapping"] = Devise.mappings[:user]

  let(:valid_attributes) {
    { name: 'Bob',
    email: 'bob@bob.com',
    password: '123456',
    password_confirmation: '123456' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post '#create', params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post '/users', params: {user: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        user = User.last
        expect(JSON.parse(response.body)).to eq({
          "id" => user.id,
          "handle" => user.handle
        })
        expect(response.location).to eq(user_url(user))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do
        post '/users', params: {user: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with a duplicate handle" do
      it "renders a JSON response with errors for the new user" do
        post '/users', params: {user: valid_attributes}, session: valid_session
        post '/users', params: {user: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
