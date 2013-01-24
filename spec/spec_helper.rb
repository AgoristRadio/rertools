APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
$: << File.join(APP_ROOT, 'lib/') # so rspec knows where your file could be

require "rertools"
#require 'awesome_print'

RSpec.configure do |config|
  #     --seed 1234
  #config.order = "random"
end
