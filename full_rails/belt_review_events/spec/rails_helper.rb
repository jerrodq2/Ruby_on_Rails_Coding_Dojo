# This file requires spec_helper, and in turn, this file is required by all other spec files, anything you put in here can be used in other files, though I have yet to put any methods in here



ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'


# **********************************************************************************
# The above code is there by default,
# **********************************************************************************



ActiveRecord::Migration.maintain_test_schema!

# **********************************************************************************
# The below code is slightly different from the default.  The default code, without comments is:

# RSpec.configure do |config|
#   config.fixture_path = "#{::Rails.root}/spec/fixtures"
#   config.use_transactional_fixtures = true
#   config.infer_spec_type_from_file_location!
#   config.filter_rails_from_backtrace!
# end

# I need to copy over the default code above, with the code below, there are slight differences, if I don't have it as the code below exactly, then the database cleaner probably wont' work properly

# **********************************************************************************


RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false # this needs to be false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Capybara::DSL

  # The below section is for the database cleaner, which cleans/clears the test database after each test
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
