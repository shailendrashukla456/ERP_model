require 'factory_bot_rails'

RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods

    config.before(:suite) do
      FactoryBot.reload
    end
 end