Gem::Specification.new do |s|
  s.name = 'twilio_send_sms'
  s.summary = 'Adds a command to send an sms from the command line'
  s.description = s.summary

  s.version = '0.0.1.5'
  s.date = '2017-03-20'

  s.authors = [ 'Luke Griffiths' ]
  s.email = 'lgcboulder@gmail.com'
  s.homepage = 'https://rubygems.org/gems/twilio_send_sms'
  s.license = 'MIT'

  s.files = [ 'lib/twilio_send_sms.rb' ]

  s.add_dependency 'activesupport', '~> 4.0'
  s.add_dependency 'twilio-ruby', '~> 4.0'

  s.add_development_dependency 'rspec'

  s.executables << 'twilio_send_sms'
end
