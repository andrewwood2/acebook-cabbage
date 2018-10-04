require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do
# RSpec.describe RegistrationsController do

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

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post :create, params: {user: valid_attributes}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        user = User.last
        expect(JSON.parse(response.body)).to eq({
          "id" => user.id,
          "name" => user.name
        })
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do
        post :create, params: {user: invalid_attributes}
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with a duplicate handle" do
      it "renders a JSON response with errors for the new user" do
        post :create, params: {user: valid_attributes}
        post :create, params: {user: valid_attributes}
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
