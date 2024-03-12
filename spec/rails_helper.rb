# require 'spec_helper'
# ENV['RAILS_ENV'] ||= 'test'
# require_relative '../config/environment'

# abort("The Rails environment is running in production mode!") if Rails.env.production?
# require 'rspec/rails'

# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# begin
#   ActiveRecord::Migration.maintain_test_schema!
# rescue ActiveRecord::PendingMigrationError => e
#   puts e.to_s.strip
#   exit 1
# end
# RSpec.configure do |config|

#   config.fixture_path = "#{::Rails.root}/spec/fixtures"

#   config.use_transactional_fixtures = true
#   config.infer_spec_type_from_file_location!
#   config.render_views
#   config.filter_rails_from_backtrace!

# end

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include RSpec::Rails::ControllerExampleGroup, type: :controller
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.render_views
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
end
