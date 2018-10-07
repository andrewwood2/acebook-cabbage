require "rails_helper"
require "api_helper"

RSpec.describe PostsController, type: :controller do
  before do
    sign_in(:user)
  end

  let(:valid_attributes) {
    { content: 'Super interesting note' }
  }

  let(:invalid_attributes) {
    {  }
  }

  let(:valid_session) { {} }

  describe "POST #create" do

    context "No sign in" do
      it "rejects the new Post" do
        post :create, params: {post: valid_attributes}
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with valid params" do
      it "creates a new Post" do

        expect {
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post :create, params: {user: valid_attributes}, session: valid_session
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
