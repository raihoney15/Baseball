# FactoryBot.define do
#     factory :tournament do
#       name { "Test Tournament" }
#       start_date { Date.today }
#       end_date { Date.tomorrow }
#       location { "Test Location" }
#       association :user
#     end
#   end
  
RSpec.configure do |config| 
config.include FactoryBot::Syntax::Methods
end