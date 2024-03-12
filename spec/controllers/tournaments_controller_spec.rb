require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:tournament) { create(:tournament) }

    it "returns a success response" do
      get :show, params: { id: tournament.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let(:tournament) { create(:tournament) }

    it "returns a success response" do
      get :edit, params: { id: tournament.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Tournament" do
        expect {
          post :create, params: { tournament: FactoryBot.attributes_for(:tournament) }
        }.to change(Tournament, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tournament" do
        expect {
          post :create, params: { tournament: FactoryBot.attributes_for(:tournament, name: nil) }
        }.to_not change(Tournament, :count)
      end
    end
  end

  describe "PUT #update" do
    let(:tournament) { create(:tournament) }

    context "with valid parameters" do
      it "updates the requested tournament" do
        put :update, params: { id: tournament.to_param, tournament: FactoryBot.attributes_for(:tournament, name: "Updated Tournament Name") }
        tournament.reload
        expect(tournament.name).to eq("Updated Tournament Name")
      end
    end

    context "with invalid parameters" do
      it "does not update the tournament" do
        put :update, params: { id: tournament.to_param, tournament: FactoryBot.attributes_for(:tournament, name: nil) }
        tournament.reload
        expect(tournament.name).not_to be_nil
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:tournament) { create(:tournament) }

    it "destroys the requested tournament" do
      expect {
        delete :destroy, params: { id: tournament.to_param }
      }.to change(Tournament, :count).by(-1)
    end
  end
end

