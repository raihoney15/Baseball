
require 'rails_helper'

RSpec.describe RoostersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:tournament) { create(:tournament) }
  let!(:team) { create(:team, tournament: tournament) }
  let!(:rooster) { create(:rooster, user: user, team: team) }
  before do
    sign_in user
  end


  describe "GET #index" do
    it "returns a successful response" do
      user = create(:user)
      get :index, params: { tournament_id: tournament.id, team_id: team.id }
      expect(response).to be_successful
    end
  end


  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: rooster.id, tournament_id: tournament.id, team_id: team.id }
      
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new, params: { tournament_id: tournament.id, team_id: team.id }
      expect(response).to be_successful
    end
  end

describe "RoostersController POST #create" do
  it "creates a new rooster" do
    puts "Rooster count before: #{Rooster.count}"

    rooster_params = attributes_for(:rooster)
    puts "Rooster params: #{rooster_params}"

    expect {
      post :create, params: { rooster: rooster_params, tournament_id: tournament.id, team_id: team.id }
    }.to change(Rooster, :count).by(1)

    puts "Rooster count after: #{Rooster.count}"
  end
end
  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: rooster.id, tournament_id: tournament.id, team_id: team.id }
      
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new, params: { tournament_id: tournament.id, team_id: team.id }
      expect(response).to be_successful
    end
  end

describe "RoostersController POST #create" do
  it "creates a new rooster" do
    puts "Rooster count before: #{Rooster.count}"

    rooster_params = attributes_for(:rooster)
    puts "Rooster params: #{rooster_params}"
  end 
end


  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: rooster.id, tournament_id: tournament.id, team_id: team.id }
      
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new, params: { tournament_id: tournament.id, team_id: team.id }
      expect(response).to be_successful
    end
  end

describe "RoostersController POST #create" do
  it "creates a new rooster" do
    puts "Rooster count before: #{Rooster.count}"

    rooster_params = attributes_for(:rooster)
    puts "Rooster params: #{rooster_params}"
  end 
end


describe "PATCH #update" do
  it "updates the rooster" do
    new_name = "Updated Name"
    patch :update, params: { id: rooster.id, rooster: attributes_for(:rooster, name: new_name), tournament_id: tournament.id, team_id: team.id }
    rooster.reload
    expect(rooster.name).to eq(new_name)
  end
end


  describe "DELETE #destroy" do
    it "deletes the rooster" do
      rooster
      expect {
        delete :destroy, params: { id: rooster.id, tournament_id: tournament.id, team_id: team.id }
      }.to change(Rooster, :count).by(-1)
    end
  end
end
