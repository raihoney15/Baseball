
FactoryBot.define do
    factory :rooster do 
      name { 'rooster1' }
      jersey_number { '1' } 

      association :user
      association :team
      tournament_id { create(:tournament).id }
      
    end
  end
