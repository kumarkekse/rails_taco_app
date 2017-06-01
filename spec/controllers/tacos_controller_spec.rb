require 'rails_helper'

RSpec.describe TacosController, type: :controller do

  let(:valid_attributes) { attributes_for(:taco, :valid_taco) }

  let(:invalid_attributes) { attributes_for(:taco, :invalid_taco) }

  let(:session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      taco = Taco.create! valid_attributes
      get :index, params: {}, session: session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      taco = Taco.create! valid_attributes
      get :show, params: {id: taco.to_param}, session: session
      expect(response).to be_success
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested taco" do
      taco = Taco.create! valid_attributes
      expect {
        delete :destroy, params: {id: taco.to_param}, session: session
      }.to change(Taco, :count).by(-1)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Taco" do
        expect {
          post :create, params: {taco: valid_attributes}, session: session
        }.to change(Taco, :count).by(1)
      end

      it "renders a JSON response with the new taco" do

        post :create, params: {taco: valid_attributes}, session: session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new taco" do

        post :create, params: {taco: invalid_attributes}, session: session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end


end