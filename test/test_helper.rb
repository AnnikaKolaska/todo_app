ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"

module ActionDispatch
  class IntegrationTest
    include Capybara::DSL
  end
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
