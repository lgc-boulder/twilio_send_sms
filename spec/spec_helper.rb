require 'rspec'
require 'pry'
require 'pry-remote'
require 'active_support/core_ext/string'

RSpec.configure do |c|
  c.backtrace_inclusion_patterns << /twilio_send_sms/
end
