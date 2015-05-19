# Kaspersky::LinuxFs

Small wrapper for Kaspersky linux file system

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kaspersky-linux_fs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaspersky-linux_fs

## Usage

```ruby
# prepare arguments
use_sudo = true
bin_path_to_kaspersky = '/opt/kaspersky/kav4fs/bin/kav4fs-control'

# create object
linux_fs = Kaspersky::LinuxFs.new(bin_path_to_kaspersky, use_sudo)

# check file for virus
file_path = '/home/user/uploads/infected_file.exe'
response = linux_fs.fast_scan(file_path)

# check response
response.threat? # => true
response.safe? # => false
````

## Contributing

1. Fork it ( https://github.com/ikantam/kaspersky-linux_fs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
