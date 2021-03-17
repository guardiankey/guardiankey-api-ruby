# Guardian Key API
This library provides developers with a simple set of bindings to help you integrate the Guardian Key API into a website and make the authentication process more secure.

## Setup
Add it to your Gemfile then run bundle to install it.

```ruby
gem 'guardian_key', github: 'eduardoazevedo3/guardiankey-api-ruby'
```

## Getting Started
Simple usage looks like:

```ruby
guardian_key = GuardianKey.new(
  organization_id: '',
  auth_group_id: '',
  key: '',
  iv: '',
  service: 'MySystem',
  agent_id: 'MyAgentId'
)

client_ip = '37.9.128.22'
user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36'
username = 'test@wecancer.com'
useremail = username
login_failed = '0'

response = guardian_key.check_access(client_ip, user_agent, username, useremail, login_failed)
response.to_json
```
