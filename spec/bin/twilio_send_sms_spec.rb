require 'spec_helper'
require 'open3'

describe 'the twilio_send_sms command' do
  it 'shows the help message if called without options' do
    result = perform_command_with_args( '' )

    expect( result ).to eq( help_message )
  end

  it 'sends a message if called with the -m flag and a config file present' do
    result = perform_command_with_args( '-m "hello world"' )

    expect( command_status_code ).to eq(0)
  end

  def perform_command_with_args( command_line_args )
    stdin, stdout, stderr, @wait_thr = Open3.popen3(
      "HOME='#{ fake_home_path }'" +
      " RUBYLIB='./spec/support/fake/gems/twilio-ruby/lib'" +
      " ./bin/twilio_send_sms #{command_line_args}"
    )

    error = stderr.read
    if error.present?
      raise "Encountered error while running command:\n\n#{error}"
    end

    stdout.read
  end

  def help_message
    <<-end_of_string
Usage: twilio_send_sms [options]
Keys listed below should go to ~/.twilio_send_sms.yml
    -u, --account-sid=value          Twilio Account SID. key: :account_sid
    -p, --auth-token=value           Twilio Auth Token. key: :auth_token
    -m, --message=value              Message
    -f, --from=value                 From Phone Number.  key: :message_from
    -t, --to=value                   To Phone Number.  key: :message_to
    -h, --help                       Show this message
    end_of_string
  end

  def command_status_code
    @wait_thr.value
  end

  def fake_home_path
    File.join( File.expand_path('.'), 'spec', 'support', 'fake', 'home' )
  end
end
