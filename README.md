# twilio_send_sms gem

Provides the command `twilio_send_sms` which sends a message.

I find this useful if I have a long-running server operation and I want to be notified when it finishes.

For example (assuming config file is already in place)

`date && mysqldump -u trinity -p irs_dbase | gcat -c ~/data/my_dumpfile.sql.gz && date && twilio_send_sms -m "database file is ready"`

Requires an account with a number that can send SMS from [Twilio](https://twilio.com).

## Installation

```
gem install twilio_send_sms
```


## Usage

### without config file (everything from command line):

```
twilio_send_sms \
  -u <your Twilio account_sid> \
  -p <Twilio auth token> \
  -f <from number - one you have set up in Twilio>
  -t <to number - will receive the text>
  -m <message content>
```


### with config file:

In `~/.twilio_send_sms.yml`:

```yaml
account_sid: 05e40596bb3d66f752ac957a86596a22cf # this is fake
auth_token: d94c98587f7674c2c76d091dc47bdd76    # also fake

message_from: "(123) 456-7890"     # An sms-enabled Twilio phone number
message_to: "345-678-1234"         # Who will receive the message.  Maybe you, as the server admin. Alternatively, specify recipient each time via -t flag

```

```bash
twilio_send_sms -m "Hello from your server"
```


