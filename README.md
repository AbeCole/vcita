# Vcita-ruby
Vcita.com API Ruby library.
For more information on their API check http://developers.vcita.com/docs.

## Usage
Install and use, more documentation should be created before this is released.
If this is publicly available then you are unfortunately on your own in this
adventure, you can try to contact [Abe Cole](mailto:me@abecole.com).

```ruby
require 'vcita'
Vcita.new('VCITA_API_TOKEN_HERE')
```

```ruby
Vcita.profile
Vcita.clients
Vcita.appointments
Vcita.payments
```

```ruby
Vcita.create_appointment({client_id: "q123w123", ...})
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'vcita-ruby'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install vcita-ruby
```

## Contributing
Make changes and if they're production ready please do a pull request,
or contact [Abe Cole](mailto:me@abecole.com).

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
