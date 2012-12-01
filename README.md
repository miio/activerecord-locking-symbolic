# Activerecord::Locking::Symbolic

This is can use lock symbolic option for activerecord


ATTENTION:

  This gem for only MySQL

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-locking-symbolic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-locking-symbolic

## Usage

Example:

  "FOR UPDATE"

  * Native: Example.find(1, lock: true)
  * This gem:  Example.find(1, lock: :write)

  "LOCK IN SHARE MODE"

  * Native: Example.find(1, lock: "LOCK IN SHARE MODE")
  * This gem:  Example.find(1, lock: :read)

  NOTE: You can use Native lock option.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
