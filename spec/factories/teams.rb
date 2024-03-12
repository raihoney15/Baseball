FactoryBot.define do
    factory :team do 
      name { 'team r' }
      short_name { 'R' }
      association :user, factory: :user
      association :tournament, factory: :tournament 
    end
  end